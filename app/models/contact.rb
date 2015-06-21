class Contact < ActiveRecord::Base

	 validates_presence_of :name
  validates_length_of :name,:within => 2..20
  validates_presence_of :phone
  validates_length_of :phone,:within => 10..15
  validates_presence_of :message
  validates_presence_of :email,email:true
  validates_presence_of :subject
end
