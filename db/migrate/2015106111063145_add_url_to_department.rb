class AddUrlToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :url, :string, :nil => false
    add_index :departments, :url, :unique => true
    Department.initialize_urls
  end
end
