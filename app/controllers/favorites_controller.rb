class FavoritesController < ApplicationController
  before_action :authorize_user

  def create
    @favorite = Favorite.new
    @trivia_fact = TriviaFact.find(params[:trivia_fact_id])
    @favorite.user = current_user
    @favorite.trivia_fact = @trivia_fact

    if @favorite.save
      flash[:notice] = 'Trivia favorited!'
    else
      flash[:notice] = 'Trivia has already been favorited'
    end
    redirect_to trivia_facts_path
  end

  def authorize_user
    unless user_signed_in?
      flash[:notice] = "You must be logged in to do that"
      redirect_to new_user_session_path
    end
  end
end
