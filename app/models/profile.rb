class Profile < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
end