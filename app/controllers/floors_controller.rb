class FloorsController < ApplicationController
  def new
    @building = Building.find(params[:building_id])
    @floor = Floor.new
  end

  def create
    raise
  end

  private

  def floor_params
    params.require(:floor).permit(:floor_type => [])
  end
end
