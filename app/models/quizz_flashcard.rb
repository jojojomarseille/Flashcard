class QuizzFlashcard < ApplicationRecord
  belongs_to :quizz
  belongs_to :question
end
