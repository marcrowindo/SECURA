class Building < ApplicationRecord
  belongs_to :request
  has_many :floors
  validates :object_type, presence: true

  before_save :set_vds_multiple

  private

  def set_vds_multiple
    case self.vds_certification
    when "VdS A (Home)"
      self.vds_multiple = 120
    when "VdS B"
      self.vds_multiple = 130
    when "VdS C"
      self.vds_multiple = 150
    else
      self.vds_multiple = 0
    end
  end
end
