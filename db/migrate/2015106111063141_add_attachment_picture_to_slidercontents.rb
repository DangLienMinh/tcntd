class AddAttachmentPictureToSlidercontents < ActiveRecord::Migration
  def self.up
    change_table :slidercontents do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :slidercontents, :picture
  end
end
