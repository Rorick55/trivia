class QuizResponsesController < ApplicationController
  def index
    @quizzes = current_user.quiz_responses
  end


  def new
    @quiz_questions = Quiz.random_quiz
    @quiz_response = QuizResponse.new
  end

  def create
    @quiz_response = QuizResponse.new(quiz_response_params)
    @quiz_response.user = current_user
    if @quiz_response.save
      flash[:notice] = "You got #{@quiz_response.total} out of 10!"
      redirect_to quiz_path(@quiz_response.quiz)
    else
      @quiz_questions = Quiz.random_quiz
      @quiz_response = QuizResponse.new
      render :new
    end
  end

  def edit
    @quiz_response = QuizResponse.find(params[:id])
    @quiz_questions = @quiz_response.quiz
  end

  def update
    @quiz_response = QuizResponse.find(params[:id])
    if @quiz_response.update(quiz_response_params)
      flash[:notice] = "You got #{@quiz_response.total} out of 10!"
      redirect_to quiz_path(@quiz_response.quiz)
    else
      render :edit
    end
  end

  private

  def quiz_response_params
    params.require(:quiz_response).permit(:answer1, :answer2, :answer3, :answer4, :answer5, :answer6, :answer7, :answer8, :answer9, :answer10, :quiz_id)
  end
end
