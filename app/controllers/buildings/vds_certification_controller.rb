class Buildings::VdsCertificationController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
    @request = @building.request
  end

  def create
    @building = Building.find(params[:building_id])
    id = params[:building_id]
    @building.update(building_params)
    request = @building.request
    request.set_price_min
    request.set_price_max
    request.save
    redirect_to building_access_count_path
  end


  private

  def building_params
    params.require(:building).permit(:vds_certification)
  end
end
