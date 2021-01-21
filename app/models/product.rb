class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :avatar
  has_many :line_items, dependent: :destroy
end
