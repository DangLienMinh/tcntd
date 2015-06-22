class Category < ActiveRecord::Base
	include Sluggable
	has_many :posts
	validates :name, presence: true

end
