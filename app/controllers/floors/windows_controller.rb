class Floors::WindowsController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
    @floors = Floor.where(building_id: params[:building_id])
  end

  def create
    @building = Building.find(params[:building_id])
    @floor.building = @building
    raise
  end
end

