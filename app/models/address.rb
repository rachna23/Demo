class Address < ApplicationRecord
  belongs_to :profile, optional: true
  validates_presence_of :city, :state, :pincode
  belongs_to :state, optional: true
  belongs_to :order, optional: true
end
