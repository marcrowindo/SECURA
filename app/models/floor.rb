class Floor < ApplicationRecord
  belongs_to :building
  validates :floor_type, presece: true
end
