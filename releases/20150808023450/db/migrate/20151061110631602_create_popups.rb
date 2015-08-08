class CreatePopups < ActiveRecord::Migration
  def change
    create_table :popups do |t|
      t.string :caption
      t.string :content
      t.integer :trangthai
      t.timestamps null: false
    end
  end
end
