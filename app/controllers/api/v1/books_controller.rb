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
        response = HttpService.new({ uri: "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn_param['isbn']}&format=json&jscmd=data"}).request;
        if response.code == 200 && JSON.parse(response.body).length > 0
          render json: JSON.parse(response.body), status: :ok
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
