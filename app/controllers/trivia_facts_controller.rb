class TriviaFactsController < ApplicationController
  def index
    if params[:format]
      @trivia_facts = TriviaFact.where("category_id = #{params[:format]}").page(params[:page])
    else
      @trivia_facts = TriviaFact.order("RANDOM()").page(params[:page])
    end
    @favorite = Favorite.new
  end

  def show
    @trivia_fact = TriviaFact.find(params[:id])
    @vote = Vote.new
    @favorite = Favorite.new
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
