class CreateQuizzFlashcards < ActiveRecord::Migration[6.1]
  def change
    create_table :quizz_flashcards do |t|
      t.references :quizz, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end

    add_index :quizz_flashcards, [:quizz_id, :question_id], unique: true
  end
end

