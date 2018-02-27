class Floor < ApplicationRecord
  belongs_to :building
  validates :floor_type, presence: true
end
