class Quote < ApplicationRecord
  has_one :booking
  belongs_to :request, optional: true
  monetize :price_cents

  before_create :generate_token


  protected

  def generate_token
    self.token = SecureRandom.urlsafe_base64(nil, false)
  end
end
