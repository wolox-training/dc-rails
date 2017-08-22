module Api
  module V1
    class BooksController < ApiController
      skip_before_action :authenticate_request, :current_user, only: [:isbn]

      def index
        render json: Book.all
      end

      def show
        render json: Book.find(params[:id]), serializer: FullBookSerializer
      end

      def isbn
        book_by_isbn = Book.find_by(isbn: isbn_param['isbn'])
        if book_by_isbn
          render json: book_by_isbn, status: :ok, serializer: FullBookSerializer
        else
          head :not_found
        end
      end

      private

      def isbn_param
        params.require(:book).permit(:isbn)
      end
    end
  end
end
