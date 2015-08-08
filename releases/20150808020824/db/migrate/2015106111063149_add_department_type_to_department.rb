class AddDepartmentTypeToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :department_type, :integer, :default => 0
  end
end
