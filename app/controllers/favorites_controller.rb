class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @trivia_fact = TriviaFact.find(params[:trivia_fact_id])
    @favorite.user = current_user
    @favorite.trivia_fact = @trivia_fact
    if !current_user
      flash[:notice] = 'You must be signed in to do that'
    elsif @favorite.save
      flash[:notice] = 'Trivia favorited!'
    else
      flash[:notice] = 'Trivia has already been favorited'
    end

    redirect_to trivia_facts_path
  end
end
