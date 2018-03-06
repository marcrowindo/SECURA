class Booking < ApplicationRecord
  belongs_to :quote
  monetize :amount_cents
end
