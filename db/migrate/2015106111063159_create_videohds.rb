class CreateVideohds < ActiveRecord::Migration
  def change
    create_table :videohds do |t|
      t.string :caption

      t.string :link

      t.integer :ordernum
      t.timestamps null: false
    end
  end
end
