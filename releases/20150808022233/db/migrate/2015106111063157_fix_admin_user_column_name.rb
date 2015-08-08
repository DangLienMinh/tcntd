class FixAdminUserColumnName < ActiveRecord::Migration
  def self.up
    rename_column :admin_users, :department_id, :page_id
  end
end
