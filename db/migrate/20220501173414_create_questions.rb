class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :question
      t.text :answer1
      t.text :answer2
      t.text :answer3
      t.text :answer4
      t.string :quizz_id

      t.timestamps
    end
  end
end
