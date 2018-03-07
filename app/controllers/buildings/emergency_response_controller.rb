class Buildings::EmergencyResponseController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
    @request = @building.request
  end

  def create
    @building = Building.find(params[:building_id])
    @request = Request.find(@building.request_id)
    id = params[:building_id]
    @building.update(emergency_response: params["building"]["emergency_response"])
    request = @building.request
    request.set_price_min
    request.set_price_max
    request.save
    redirect_to request_path(@request)
  end
end
