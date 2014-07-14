class QuizzesController < ApplicationController
  def show
    @quiz = Quiz.find(params[:id])
    @quiz_responses = QuizResponse.where(user_id: current_user.id, quiz_id: @quiz.id).first
    @favorite = Favorite.new
  end
end
