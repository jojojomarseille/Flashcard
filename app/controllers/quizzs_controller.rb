class QuizzsController < ApplicationController
  before_action :set_quizz, only: [:show, :start, :play, :answer, :result]
  def show
    @quizz = Quizz.find(params[:id])
    @questions = @quizz.questions
  end

  def index
  end

  def create
    @quizz = Quizz.new(quizz_params.except(:question_ids))
    @quizz.user = current_user
    if @quizz.save
      # Parcourir les question_ids pour créer des QuizzFlashcards
      question_ids = quizz_params["question_ids"].reject(&:blank?)
      question_ids.each do |question_id|
        question = Question.find_by(id: question_id)
        if question
          QuizzFlashcard.create(question: question, quizz: @quizz)
        end
      end

      puts "Quizz enregistré avec succès : #{@quizz.inspect}"
      redirect_to @quizz, notice: 'Quizz créé avec succès.'
    else
      puts "Erreur lors de la sauvegarde du Quizz : #{@quizz.errors.full_messages.join(", ")}"
      render :new
    end
  end

  def add_questions
    @quizz = Quizz.find(params[:id])
    question_ids = params[:question_ids].reject(&:blank?)
    question_ids.each do |question_id|
      question = Question.find_by(id: question_id)
      if question && !@quizz.questions.include?(question)
        @quizz.quizz_flashcards.create(question: question)
      end
    end
    redirect_to @quizz, notice: "Questions ajoutées avec succès."
  end

  def new
    @quizz = Quizz.new
  end

#la partie suivante sert a jouer les quizz
def start
  # Initialise l'état du quiz pour le début du jeu, stocké dans la session par exemple
  session[:quizz_question_ids] = @quizz.questions.pluck(:id)
  session[:current_question_index] = 0
  session[:correct_answers] = 0
  redirect_to play_quizz_path(@quizz)
end

def play
  puts "quizz: #{@quizz}"
  @current_index = session[:current_question_index] || 0
  question_ids = session[:quizz_question_ids]
  if @current_index >= question_ids.length
    redirect_to result_quizz_path(@quizz) and return
  end
  @question = Question.find(question_ids[@current_index])
end

# def answer
#   @current_index = session[:current_question_index]
#   question_ids = session[:quizz_question_ids]
#   @question = Question.find(question_ids[@current_index])

#   # Check the user's answer
#   if @question.correct_answers_array.include?(params[:answer])
#     session[:correct_answers] += 1
#   end

#   # Move to the next question
#   session[:current_question_index] += 1
#   redirect_to play_quizz_path(@quizz)
# end

def answer
  @current_index = session[:current_question_index]
  question_ids = session[:quizz_question_ids]
  @question = Question.find(question_ids[@current_index])

  # Évaluer la réponse de l'utilisateur
  if @question.correct_answers_array.include?(params[:answer])
    session[:correct_answers] += 1
  end

  # Passer à la question suivante
  session[:current_question_index] += 1
  if session[:current_question_index] < question_ids.length
    redirect_to play_quizz_path(@quizz)
  else
    redirect_to result_quizz_path(@quizz)
  end
end

def result
  @total_questions = session[:quizz_question_ids].length
  @correct_answers = session[:correct_answers]
  # Clear the session state
  session.delete(:quizz_question_ids)
  session.delete(:current_question_index)
  session.delete(:correct_answers)
end

private

def quizz_params
  params.require(:quizz).permit(:title, :description, question_ids: [])
end

def set_quizz
  @quizz = Quizz.find(params[:id])
end

end