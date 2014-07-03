class TriviaFactsController < ApplicationController
  def index
    @trivia_facts = TriviaFact.all
  end

  def show
    @trivia_fact = TriviaFact.find(params[:id])
  end
end
