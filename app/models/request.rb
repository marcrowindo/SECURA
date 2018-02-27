class Request < ApplicationRecord
  has_one :user
  has_one :building
  validates :zip_code, presence: true
end
