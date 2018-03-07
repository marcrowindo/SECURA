class FloorsController < ApplicationController
  def new
    @building = Building.find(params[:building_id])
    @floor = Floor.new
  end

  def create
    # params[:floor][:floor_type].delete("")
    floor_array = params[:floor][:floor_type]
    floor_array.delete('')
    @building = Building.find(params[:building_id])
    # @floor.min_detector = set_motion_detectors(@floor.name)[:min]
    floor_array.each do |floor|
      @floor = Floor.new(floor_type: floor)
      @floor.building = @building
      @floor.save
    end

    respond_to do |format|
      format.js
    end

    # redirect_to building_hull_security_path(@building)
  end

  private

  def floor_params
    params.require(:floor).permit(:floor_type => [])
  end

  # def set_motion_detectors(floor_name)
  #   motion_dect = {
  #     "ground_floor" => {
  #       min: 0.1,
  #       max: 0.3
  #     }
  #   }
  #   motion_dect[floor_name]

  # end
end
