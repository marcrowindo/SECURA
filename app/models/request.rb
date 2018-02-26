class Request < ApplicationRecord
  belongs_to :user
  has_one :building
  validates :zip_code, presence: true
end
