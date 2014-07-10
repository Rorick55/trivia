class VotesController < ApplicationController
  before_action :authorize_user

  def create
    @trivia_fact = TriviaFact.find(params[:trivia_fact_id])
    @vote = Vote.find_or_initialize_by(
      user: current_user,
      trivia_fact: @trivia_fact
      )

    if @vote.update(vote_params) || @vote.save
      @trivia_fact.update_rank
      redirect_to trivia_fact_path(@trivia_fact)
    else
      redirect_to trivia_fact_path(@trivia_fact)
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:vote)
  end

  def authorize_user
    unless user_signed_in?
      flash[:notice] = "You must be logged in to do that"
      redirect_to new_user_session_path
    end
  end
end
