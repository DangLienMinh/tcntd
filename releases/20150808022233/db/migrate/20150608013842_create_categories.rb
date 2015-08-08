class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps null: false
    end
create_table :posts do |t|
      t.string :title 
	t.string :summary 
	t.text :content 
      t.timestamps null: false
    end
  end
end
