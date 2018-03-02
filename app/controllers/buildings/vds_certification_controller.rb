class Buildings::VdsCertificationController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
    @request = @building.request
  end

  def create
    @building = Building.find(params[:building_id])
    id = params[:building_id]
    @building.update(vds_certification: params["/buildings/#{id}/vds_certification"]["vds_certification"])
    @building.save
    request = @building.request
    request.set_price_min
    request.set_price_max
    request.save
    redirect_to building_access_count_path
  end

end
