class Admin::TriviaFactsController < ApplicationController
  before_action :authorize_admin

  def index
    @trivia_facts = TriviaFact.all
  end

  def show
    @trivia_fact = TriviaFact.find(params[:id])
  end

  def edit
    @trivia_fact = TriviaFact.find(params[:id])
  end

  def update
    @trivia_fact = TriviaFact.find(params[:id])
    if @trivia_fact.update(trivia_fact_params)
      flash[:notice] = 'Successfully updated trivia fact!'
      redirect_to admin_trivia_fact_path(@trivia_fact)
    else
      render :edit
    end
  end

  def activate
    @trivia_fact = TriviaFact.find(params[:id])
    if @trivia_fact.update(featured: true)
      flash[:notice] = 'Triva featured!'
      redirect_to admin_trivia_facts_path
    else
      flash[:notice] = 'Unable to feature triva.'
      render :index
    end
  end

  def destroy
    @trivia_fact = TriviaFact.find(params[:id])
    if @trivia_fact.delete
      flash[:notice] = 'Successfully deleted trivia fact!'
      redirect_to admin_trivia_facts_path
    else
      flash[:notice] = 'Could not deleted trivia fact'
      render :index
    end
  end

  private

  def trivia_fact_params
    params.require(:trivia_fact).permit(:question, :answer, :category_id)
  end

  def authorize_admin
    unless current_user.is_admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
