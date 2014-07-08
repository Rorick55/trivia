class VotesController < ApplicationController
  def create
    @trivia_fact = TriviaFact.find(params[:trivia_fact_id])
    @vote = Vote.find_or_initialize_by(
      user: current_user,
      trivia_fact: @trivia_fact
      )
    if !current_user
      flash[:notice] = "You must be logged in to do that"
      redirect_to trivia_fact_path(@trivia_fact)
    elsif @vote.update(vote_params) || @vote.save
      @trivia_fact.update_rank
      redirect_to trivia_fact_path(@trivia_fact)
    else
      redirect_to trivia_fact_path(@trivia_fact)
    end
  end

  def vote_params
    params.require(:vote).permit(:vote)
  end
end
