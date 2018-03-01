class Floors::RoomsController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
    @floors = Floor.where(building_id: params[:building_id])
  end

  def create
    @building = Building.find(params[:building_id])
    id_array = params[:floors].keys
    floor_array = Floor.where(building_id: params[:building_id])

    id_array.each do |id|
      room_amount = params[:floors][id][:rooms]
      floor = Floor.find(id)
      floor.rooms = room_amount
      floor.save
    end
    redirect_to building_vds_certification_path(@building)
  end
end
