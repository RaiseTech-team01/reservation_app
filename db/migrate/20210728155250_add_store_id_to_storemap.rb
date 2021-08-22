class AddStoreIdToStoremap < ActiveRecord::Migration[6.1]
  def change
    add_column :storemaps, :store_id, :string
  end
end
