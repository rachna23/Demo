class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :profile
  has_many :addresses, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :addresses, allow_destroy: true
end
