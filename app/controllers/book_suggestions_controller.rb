class BookSuggestionsController < ApplicationController
  def new
    @users = User.all
    @suggestion = BookSuggestion.new
  end
end
