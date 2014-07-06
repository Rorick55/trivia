class VotingsController < ApplicationController

  def create
    @trivia_fact = TriviaFact.find(params[:trivia_fact_id])
    @voting = Voting.find_or_initialize_by(
      user: current_user,
      trivia_fact: @trivia_fact
      )
    if !current_user
      flash[:notice] = "You must be logged in to do that"
      render template: "trivia_facts/show"
    elsif @voting.update(voting_params)
      @trivia_fact.update_rank
      redirect_to trivia_fact_path(@trivia_fact)
    elsif @voting.save
      binding.pry
      @trivia_fact.update_rank
      redirect_to trivia_fact_path(@trivia_fact)
    else
      render template: "trivia_facts/show"
    end
  end

  def voting_params
    params.require(:voting).permit(:vote)
  end
end
