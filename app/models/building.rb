class Building < ApplicationRecord
  belongs_to :request
  has_many :floors
  validates :object_type, presece: true
end
