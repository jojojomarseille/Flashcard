class Quizz < ApplicationRecord
  has_many :quizz_flashcards, dependent: :destroy
  has_many :questions, through: :quizz_flashcards

  belongs_to :user

  # validates :title, presence: true
end
