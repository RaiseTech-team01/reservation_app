class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.timestamps :date_at
      t.timestamps :date_on
      t.int :number_people
      t.string :menu
      t.int :budget
      t.text :inquiry
      t.string :reservation_number
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
