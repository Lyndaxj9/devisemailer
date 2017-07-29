class Contact < ActiveRecord::Base
	
	validates_presence_of :name
	validates :email, presence: true, format: { with: /.+@.+\..+/i, message: "enter a valid email address" }
	validates_presence_of :message
end