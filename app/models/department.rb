class Department < ActiveRecord::Base
	has_many :admin_users
	has_many :posts
	validates :name, presence: true

end
