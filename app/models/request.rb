class Request < ApplicationRecord
  has_one :user
  accepts_nested_attributes_for :user
  has_one :building
  validates :zip_code, presence: true
end
