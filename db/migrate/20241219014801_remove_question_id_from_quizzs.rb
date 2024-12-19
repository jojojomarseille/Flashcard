class RemoveQuestionIdFromQuizzs < ActiveRecord::Migration[6.1]
  def change
    remove_column :quizzs, :question_id, :string
  end
end
