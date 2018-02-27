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
    floor_array.each do |floor|
      @floor = Floor.new(floor_type: floor)
      @floor.building = @building
      @floor.save
    end
    redirect_to building_floors_path(@building)
  end

  def index
    @floors = Floor.where(building_id: params[:building_id])
    @building = Building.find(params[:building_id])
  end

  def update
  end

  private

  def floor_params
    params.require(:floor).permit(:floor_type => [])
  end
end
