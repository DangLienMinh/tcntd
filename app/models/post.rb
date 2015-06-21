class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :department
	belongs_to :admin_user
	has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/
  	validates :name, presence: true
  	validates :summary, presence: true
  	validates :content, presence: true
  	validates :name, presence: true

	acts_as_url :name, :sync_url => true, url_attribute: :url
	def to_param
	  "#{id}-#{url}"
	end
end
