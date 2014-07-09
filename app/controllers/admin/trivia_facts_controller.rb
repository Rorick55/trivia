class Admin::TriviaFactsController < ApplicationController
  before_action :authorize_admin

  def index
    @trivia_facts = TriviaFact.all
  end

  def show
    @trivia_fact = TriviaFact.find(params[:id])
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
