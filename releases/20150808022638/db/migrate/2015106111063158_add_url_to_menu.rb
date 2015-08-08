class AddUrlToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :url, :string, :nil => false
    add_index :menus, :url, :unique => true
    Menu.initialize_urls
  end
end
