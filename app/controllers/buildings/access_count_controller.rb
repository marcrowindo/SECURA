class Buildings::AccessCountController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
    @request = @building.request
  end

  def create
    @building = Building.find(params[:building_id])
    id = params[:building_id]
    @building.update(access_count: params["building"]["access_count"])
    @building.save
    @request = @building.request
    @request.set_price_min
    @request.set_price_max
    @request.save

    respond_to do |format|
      format.js
    end

    # redirect_to building_emergency_response_path
  end

end
