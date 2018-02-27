class User < ApplicationRecord
  belongs_to :request
  validates :email, presence: true, uniqueness: true
end
