module Api
  module V1
    class BookSuggestionsController < ApiController
      def index
        render json: BookSuggestion.all
      end

      def show
        render json: BookSuggestion.find(params[:id])
      end
    end
  end
end
