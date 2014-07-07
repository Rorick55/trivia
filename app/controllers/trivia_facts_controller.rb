class TriviaFactsController < ApplicationController
  def index
    @trivia_facts = TriviaFact.all
  end

  def show
    @trivia_fact = TriviaFact.find(params[:id])
    @vote = Vote.new
  end

  def new
    @trivia_fact = TriviaFact.new
  end

  def create
    @trivia_fact = TriviaFact.new(trivia_fact_params)
    if @trivia_fact.save
      flash[:notice] = "Successfully added new trivia!"
      redirect_to trivia_fact_path(@trivia_fact)
    else
      render :new
    end
  end

  def trivia_fact_params
    params.require(:trivia_fact).permit(:question, :answer, :category_id)
  end
end
