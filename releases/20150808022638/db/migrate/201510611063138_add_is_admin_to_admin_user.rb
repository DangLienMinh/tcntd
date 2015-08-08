class AddIsAdminToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :is_admin, :integer, :default => 0
  end
end
