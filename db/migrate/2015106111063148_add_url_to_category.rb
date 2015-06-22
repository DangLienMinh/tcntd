class AddUrlToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :url, :string, :nil => false
    add_index :categories, :url, :unique => true
    Category.initialize_urls
  end
end
