module Api
  module V1
    class BooksController < ApiController
      def index
        render json: Book.all
      end

      def show; end
    end
  end
end
