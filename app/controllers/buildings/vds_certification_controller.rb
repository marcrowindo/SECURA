class Buildings::VdsCertificationController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
    @request = @building.request
  end

  def create
    @building = Building.find(params[:building_id])
    @building.update(vds_certification: params["building"]["vds_certification"])
    @building.save
    @request = @building.request
    @request.set_price_min
    @request.set_price_max
    @request.save

    respond_to do |format|
      format.js
    end
  end

  private

  def building_params
    params.require(:building).permit(:vds_certification)
  end
end
