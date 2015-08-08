class RemoveDepartmentType < ActiveRecord::Migration
  def change
  	remove_column :departments, :department_type
  end
end
