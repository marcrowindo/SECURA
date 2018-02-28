class Buildings::VdsCertificationController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
  end

  def create
    @building = Building.find(params[:building_id])
    id = params[:building_id]
    @building.update(vds_certification: params["/buildings/#{id}/vds_certification"]["vds_certification"])
    @building.save
    redirect_to root_path
  end

end
