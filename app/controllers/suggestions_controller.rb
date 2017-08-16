class SuggestionsController < ApplicationController
  def new
    @users = User.all
    @suggestion = Suggestion.new
  end

  def create
    suggestion_params = params.require(:suggestion).permit!
    suggestion = Suggestion.new(suggestion_params)

    if suggestion.save
      head :created
    else
      render suggestion.errors
    end
  end
end
