class AddMenuIdToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :menu_id, :integer
  end
end
