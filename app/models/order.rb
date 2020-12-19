class Order < ApplicationRecord
	has_many :line_items, dependent: :destroy
	belongs_to :profile
end
