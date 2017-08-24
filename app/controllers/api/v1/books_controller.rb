module Api
  module V1
    class BooksController < ApiController
      skip_before_action :authenticate_request, :current_user, only: [:isbn, :isbn_status]

      def index
        render json: Book.all
      end

      def show
        render json: Book.find(params[:id]), serializer: FullBookSerializer
      end

      def isbn
        job_id = ExternalRequestWorker.perform_async(isbn_param[:isbn])
        render json: { request: job_id }, status: :ok
      end

      def isbn_status
        if Sidekiq::Status::status(job_id_param[:id]) == :complete
          isbn = ExternalBook.find_by(worker_id: job_id_param[:id])
          render json: { data: isbn.data }, status: :ok
        else
          render json: { status: Sidekiq::Status::status(job_id_param[:id]) }, status: :bad_request
        end
      end

      private

      def isbn_param
        params.require(:book).permit(:isbn)
      end

      def job_id_param
        params.require(:worker).permit(:id)
      end
    end
  end
end
