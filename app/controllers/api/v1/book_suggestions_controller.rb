module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :current_user, :authenticate_request

      def index
        render json: BookSuggestion.all
      end

      def show
        render json: BookSuggestion.find(params[:id])
      end

      def create
        suggestion = BookSuggestion.new(book_suggestions_params)
        if suggestion.save
          head :created
        else
          render json: { errors: suggestion.errors.to_h, status: :bad_request }, status: 418
        end
      end

      private

      def book_suggestions_params
        params.require(:bookSuggestion)
              .permit(:title, :author, :link, :publisher, :year, :editorial, :price, :user_id)
      end
    end
  end
end
