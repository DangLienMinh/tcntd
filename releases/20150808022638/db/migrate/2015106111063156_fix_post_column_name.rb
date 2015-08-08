class FixPostColumnName < ActiveRecord::Migration
  def self.up
    rename_column :posts, :department_id, :page_id
  end
end
