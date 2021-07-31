class CreateUserStores < ActiveRecord::Migration[6.1]
  def change
    create_table :user_stores do |t|
      t.timestamps
    end
  end
end
