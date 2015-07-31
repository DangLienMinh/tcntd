class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :parent,:default => 0
      t.integer :order

      t.timestamps null: false
    end
  end
end
