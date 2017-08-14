class SuggestionsController < ApplicationController
  def new
    @Users = User.all
  end
end
