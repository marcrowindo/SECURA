class Request < ApplicationRecord
  has_one :user
  has_one :building
  has_many :quotes

  validates :zip_code, presence: true,
                        format: { with: /(?!01000|99999)(0[1-9]\d{3}|[1-9]\d{4})/i, message: "Invalid zip code"}
  validates_associated :user

  accepts_nested_attributes_for :user

  # PRICE
  def set_price_min
    price = detectors_min + sensors_min
    price *= (building.vds_multiple.to_f / 100) unless (building.vds_multiple == 0) || (building.vds_multiple.nil?)
    price += person_access_min unless person_access_min.nil?
    self.price_min = price.round
  end

  def set_price_max
    price = detectors_max + sensors_max
    price *= (building.vds_multiple.to_f / 100) unless (building.vds_multiple == 0) || (building.vds_multiple.nil?)
    price += person_access_max unless person_access_max.nil?
    self.price_max = price.round
  end

  private

  # DETECTORS
  def detectors_min
    detectors_price = 0
    building.floors.each do |floor|
      detectors_price += 130 * (floor.motion_detector_min.to_f / 100)
    end
    detectors_price
  end

  def detectors_max
    detectors_price = 0
    building.floors.each do |floor|
      detectors_price += 730 * (floor.motion_detector_min.to_f / 100)
    end
    detectors_price
  end

  # SENSORS
  def sensors_min
    sensors_price = 0
    building.floors.each do |floor|
      sensors_price += floor.windows_and_doors_sensor * 150
    end
    sensors_price
  end

  def sensors_max
    sensors_price = 0
    building.floors.each do |floor|
      sensors_price += floor.windows_and_doors_sensor * 200
    end
    sensors_price
  end

  # PERSON ACCESS
  def person_access_min
    building.access_count * 50 if building.access_count
  end

  def person_access_max
    building.access_count * 150 if building.access_count
  end

end
