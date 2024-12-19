class RemoveQuizzIdFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :quizz_id, :string
  end
end
  
