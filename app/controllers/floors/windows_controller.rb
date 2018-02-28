class Floors::WindowsController < ApplicationController
  def new
    @building = Building.find(params[:building_id])
    @floors = Floor.where(building_id: params[:building_id])
  end

  def create
    id_array = params[:floors].keys
    floor_array = Floor.where(building_id: params[:building_id])

    id_array.each do |id|
      window_amount = params[:floors][id][:windows]
      floor = Floor.find(id)
      floor.windows = window_amount
      floor.save 
      raise
    end
  end
end

