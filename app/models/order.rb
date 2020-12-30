class Order < ApplicationRecord
	has_many :line_items, dependent: :destroy
	belongs_to :profile
	belongs_to :billing_address, :class_name => "Address"
    belongs_to :shipping_address, :class_name => "Address"
    accepts_nested_attributes_for :shipping_address
	accepts_nested_attributes_for :billing_address
end
