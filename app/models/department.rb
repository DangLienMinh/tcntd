class Department < ActiveRecord::Base
	has_many :admin_users
end
