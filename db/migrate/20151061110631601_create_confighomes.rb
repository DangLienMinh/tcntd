class CreateConfighomes < ActiveRecord::Migration
  def change
    create_table :confighomes do |t|
      t.integer :numslider
      t.integer :numpostbox
      t.string :muctieu
      t.string :cacnghedt
      t.string :diachi
      t.string :phone
      t.string :email
      t.string :linkfb
      t.string :linktw
      t.string :copyright
      t.integer :trangthai
      t.timestamps null: false
    end
  end
end
