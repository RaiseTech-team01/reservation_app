class CreateStoremaps < ActiveRecord::Migration[6.1]
  def change
    create_table :storemaps do |t|
      t.string :url

      t.timestamps
    end
  end
end
