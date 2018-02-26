class User < ApplicationRecord
  has_many :requests
  validates :email, presence: true, uniqueness: true
end
