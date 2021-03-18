class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :date_at
      t.string :date_on
      t.integer :number_people
      t.string :menu
      t.integer :budget
      t.text :inquiry
      t.string :reservation_number
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
