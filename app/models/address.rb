class Address < ApplicationRecord
	belongs_to :profile, optional: true
	validates_presence_of :city, :state, :landmark, :pincode, :address, :street_address
end
