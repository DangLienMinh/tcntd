class Department < ActiveRecord::Base
	has_many :admin_users
	has_many :posts
	belongs_to :menu
	validates :name, presence: true
	include Sluggable
	# acts_as_url :name, :sync_url => true, url_attribute: :url
	# def to_param
	#   "#{id}-#{url}"
	# end
end
