class AddDepartmentIdToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :department_id, :integer
  end
end
