class AddAttachmentPic1Pic2Pic3Pic4Pic5ToSliders < ActiveRecord::Migration
  def self.up
    change_table :sliders do |t|
      t.attachment :pic1
      t.attachment :pic2
      t.attachment :pic3
      t.attachment :pic4
      t.attachment :pic5
    end
  end

  def self.down
    remove_attachment :sliders, :pic1
    remove_attachment :sliders, :pic2
    remove_attachment :sliders, :pic3
    remove_attachment :sliders, :pic4
    remove_attachment :sliders, :pic5
  end
end
