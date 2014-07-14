class QuizResponsesController < ApplicationController
  def new
    @quiz_questions = Quiz.random_quiz
    @quiz_response = QuizResponse.new
  end

  def create
    @quiz_response = QuizResponse.new(quiz_response_params)
    @quiz_response.user = current_user
    binding.pry
    if @quiz_response.save
      flash[:notice] = @quiz_response.total_response
      redirect_to quiz_path(@quiz_response.quiz)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def quiz_response_params
    params.require(:quiz_response).permit(:answer1, :answer2, :answer3, :answer4, :answer5, :answer6, :answer7, :answer8, :answer9, :answer10, :quiz_id)
  end
end
