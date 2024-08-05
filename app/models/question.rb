class Question < ApplicationRecord
    # Convertir le champ correct_answers en tableau lors de sa récupération
  def correct_answers_array
    correct_answers.split(',').map(&:strip)
  end

  # Définir le champ correct_answers à partir d'un tableau
  def correct_answers_array=(values)
    self.correct_answers = values.join(',')
  end
end
