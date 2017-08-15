class SuggestionsController < ApplicationController
  @@Suggestions = []

  def new
    @Users = User.all
    @Suggestion = Suggestion.new
    if params.has_key?(:created)
      @areSuggestions = params[:created]
      @Suggestions = @@Suggestions
    else
      @areSuggestions = false
    end
  end

  def create
    suggestion_params = params.require(:suggestion).permit!
    suggestion = Suggestion.new(suggestion_params)

    if suggestion.save
      @@Suggestions.push(suggestion)
      redirect_to action: :new, status: :created, created: true
    else
      render suggestion.errors
    end
  end
end
