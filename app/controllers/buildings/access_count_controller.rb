class Buildings::AccessCountController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
  end

  def create
    @building = Building.find(params[:building_id])
    id = params[:building_id]
    @building.update(access_count: params["/buildings/#{id}/access_count"]["access_count"])
    @building.save
    redirect_to building_emergency_response_path
  end

end
