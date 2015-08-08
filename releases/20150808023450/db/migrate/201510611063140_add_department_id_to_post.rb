class AddDepartmentIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :department_id, :integer
  end
end
