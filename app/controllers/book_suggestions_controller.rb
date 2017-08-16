class BookSuggestionsController < ApplicationController
  def new
    @users = User.all
    @suggestion = BookSuggestion.new
  end

  def create
    suggestion_params = params.require(:book_suggestion).permit!
    suggestion = BookSuggestion.new(suggestion_params)

    if suggestion.save
      head :created
    else
      render suggestion.errors
    end
  end
end
