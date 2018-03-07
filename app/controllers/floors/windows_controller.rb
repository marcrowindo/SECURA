class Floors::WindowsController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
    @floors = Floor.where(building_id: params[:building_id])
    @request = @building.request
  end

  def create
    @building = Building.find(params[:building_id])
    id_array = params[:floors].keys
    @floors = Floor.where(building_id: params[:building_id])

    id_array.each do |id|
      window_amount = params[:floors][id][:windows]
      floor = Floor.find(id)
      floor.windows = window_amount
      floor.save
    end
    @request = @building.request
    @request.set_price_min
    @request.set_price_max
    @request.save

    respond_to do |format|
      format.js
    end

    # redirect_to building_floors_rooms_path(@building)
  end
end
