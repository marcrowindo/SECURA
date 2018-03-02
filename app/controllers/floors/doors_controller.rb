class Floors::DoorsController < ApplicationController
  def new
    @building = Building.find(params[:building_id])
    @floors = Floor.where(building_id: params[:building_id])
  end

  def create
    @building = Building.find(params[:building_id])
    id_array = params[:floors].keys
    floor_array = Floor.where(building_id: params[:building_id])

    id_array.each do |id|
      door_amount = params[:floors][id][:doors]
      floor = Floor.find(id)
      floor.doors = door_amount
      floor.save
    end
    request = @building.request
    request.set_price_min
    request.set_price_max
    request.save
    redirect_to building_floors_windows_path(@building)
  end
end
