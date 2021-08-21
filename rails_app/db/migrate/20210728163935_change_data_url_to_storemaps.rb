class ChangeDataUrlToStoremaps < ActiveRecord::Migration[6.1]
  def change
    change_column :storemaps, :url, :text
  end
end
