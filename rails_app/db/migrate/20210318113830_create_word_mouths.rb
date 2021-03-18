class CreateWordMouths < ActiveRecord::Migration[6.1]
  def change
    create_table :word_mouths do |t|
      t.string :visit_day
      t.string :title
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
