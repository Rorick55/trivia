class UnfeaturedTriviaFactsController < ApplicationController

  def index
    @trivia_facts = TriviaFact.where(featured: false).order(:created_at).page(params[:page])
    @vote = Vote.new
    @favorite = Favorite.new
  end
end
