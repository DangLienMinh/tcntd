class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :name

      t.string :infobig
      t.string :infosmall
      t.timestamps null: false
    end
  end
end
