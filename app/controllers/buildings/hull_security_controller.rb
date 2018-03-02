class Buildings::HullSecurityController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
  end

  def create
    @building = Building.find(params[:building_id])
    @building.update(security_hull: building_params[:security_hull])
    
    if @building.security_hull == "Yes"
      redirect_to building_floors_doors_path(@building)
    else
      redirect_to building_vds_certification_path(@building)
    end
  end

  private

  def building_params
    params.require(:building).permit(:security_hull)
  end
  
end
