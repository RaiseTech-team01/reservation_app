class CreateQuestionAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :question_answers do |t|
      t.string :title
      t.text :body
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
