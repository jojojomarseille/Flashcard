class CreateQuizzs < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzs do |t|
      t.string :question_id
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
