class Buildings::EmergencyResponseController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
  end

  def create
    @building = Building.find(params[:building_id])
    id = params[:building_id]
    @building.update(emergency_response: params["/buildings/#{id}/emergency_response?method=patch"]["emergency_response"])
    raise
  end
end
