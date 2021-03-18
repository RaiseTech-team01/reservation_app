class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.string :business_hours
      t.string :regular_holiday
      t.string :title
      t.text :body
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
