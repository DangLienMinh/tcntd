class AddSloganToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :slogan, :string
  end
end
