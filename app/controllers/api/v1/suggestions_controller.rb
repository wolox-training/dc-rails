module Api
  module V1
    class SuggestionsController < ApiController
      def index
        render json: Suggestion.all
      end

      def show
        render json: Suggestion.find(params[:id])
      end
    end
  end
end
