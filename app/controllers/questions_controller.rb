class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :playshow, :check_answer]

  def show
    # @question = Question.find(params[:id])
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

  def playshow
  end

  def check_answer
    selected_answers = params[:answers]
    
    correct_answers = @question.correct_answers_array

    if correct_answers.sort == selected_answers.sort
      redirect_to success_path, notice: 'Bonne réponse !'
    else
      redirect_to fail_path, alert: 'Mauvaise réponse. Essaie encore !'
    end
  end

  def new
    @question = Question.new
  end

  private

  def question_params
    params.require(:question).permit(:question, :answer1, :answer2, :answer3, :answer4, correct_answers_array: [])
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
