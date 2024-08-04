class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def new
    @question = Question.new
  end

  private

  def question_params
    params.require(:question).permit(:question, :answer1, :answer2, :answer3, :answer4, correct_answers_array: [])
  end

end
