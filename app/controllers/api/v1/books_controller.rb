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
        response = HttpService.new(uri: isbn_uri).request

        if response.code == 200 && !JSON.parse(response.body).empty?
          render json: JSON.parse(response.body), status: :ok
        else
          head :not_found
        end
      end

      private

      def isbn_param
        params.require(:book).permit(:isbn)
      end

      def isbn_uri
        url_base = 'https://openlibrary.org/api/books'
        url_query = "?bibkeys=ISBN:#{isbn_param['isbn']}&format=json&jscmd=data"
        url_base + url_query
      end
    end
  end
end
