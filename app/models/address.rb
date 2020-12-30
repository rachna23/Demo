class Address < ApplicationRecord
	belongs_to :profile, optional: true
	validates_presence_of :city, :state, :landmark, :pincode, :address, :street_address
	has_many :billing_addresses, :class_name => "Order", :foreign_key => "billing_address_id" 
    has_many :shipping_addresses, :class_name => "Order", :foreign_key => "shipping_address_id"
    belongs_to :state, optional: true

end
