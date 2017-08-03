module Api
  module V1
    class BooksController < ApiController
      def index
        render json: Book.all
      end

      def show
        render json: Book.find(params[:id]), serializer: FullBookSerializer
      end
    end
  end
end
