class Menu < ActiveRecord::Base
	has_one :page

	include Sluggable
end
