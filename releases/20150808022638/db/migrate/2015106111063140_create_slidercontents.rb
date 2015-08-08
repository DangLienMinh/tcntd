class CreateSlidercontents < ActiveRecord::Migration
  def change
    create_table :slidercontents do |t|
      t.string :link

      t.string :topcaption
      t.string :botcaption
      t.integer :ordernum
      t.timestamps null: false

    end
  end
end
