class Question < ApplicationRecord
  belongs_to :user
  has_many :quizz_flashcards, dependent: :destroy
  has_many :quizzs, through: :quizz_flashcards

  # validates :question, presence: true

  def correct_answers_array
    correct_answers.split(',').map(&:strip)
  end

  # Définir le champ correct_answers à partir d'un tableau
  def correct_answers_array=(values)
    self.correct_answers = values.join(',')
  end
end
