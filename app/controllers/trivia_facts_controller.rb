class TriviaFactsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    if params[:format]
      @trivia_facts = TriviaFact.where(featured: true).where("category_id = #{params[:format]}").order('id DESC').page(params[:page])
      @category = Category.find(params[:format]).name
    else
      @trivia_facts = TriviaFact.where(featured: true).order("RANDOM()").page(params[:page])
      @category = "Trivia"
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
      redirect_to unfeatured_trivia_facts_path
    else
      render :new
    end
  end

  private

  def trivia_fact_params
    params.require(:trivia_fact).permit(:question, :answer, :category_id)
  end

  def authorize_user
    unless user_signed_in?
      flash[:notice] = "You must be logged in to do that"
      redirect_to new_user_session_path
    end
  end
end
