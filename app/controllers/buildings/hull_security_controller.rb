class Buildings::HullSecurityController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
  end

  def create
    @building = Building.find(params[:building_id])
    @building.update(security_hull: building_params[:security_hull])
    
    redirect_to building_floors_rooms_path
  end

  private

  def building_params
    params.require(:building).permit(:security_hull)
  end
  
end
