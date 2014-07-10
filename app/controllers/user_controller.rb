class UserController < ApplicationController
  def show
    @trivia_facts = current_user.trivia_facts.page(params[:page])
  end
end
