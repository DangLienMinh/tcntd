class AddDescriptionToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :description, :text
  end
end
