class Floor < ApplicationRecord
  belongs_to :building
  validates :floor_type, presence: true
  before_save :set_motion_detector, :set_windows_and_doors
  
  private 

  def set_motion_detector

    motion_dect = {
      "Basement" => {
        min: 10,
        max: 30
      },
      "Ground floor" => {
        min: 90,
        max: 100
      },
      "1st floor" => {
        min: 80,
        max: 100
      },
      "2nd floor" => {
        min: 70,
        max: 100
      },
      "3rd floor" => {
        min: 0,
        max: 50
      },
      "4th floor" => {
        min: 0,
        max: 20
      },
      "Attic" => {
        min: 0,
        max: 0
      }
    }

    self.motion_detector_min = motion_dect[floor_type][:min]
    self.motion_detector_max = motion_dect[floor_type][:max]
  end

  def set_windows_and_doors
    self.windows_and_doors_sensor = self.doors.to_i + self.windows.to_i
  end
end
