class AddCorrectAnswersToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :correct_answers, :text
  end
end
