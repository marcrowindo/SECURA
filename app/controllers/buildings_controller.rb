class BuildingsController < ApplicationController

  def new
    @building = Building.new
    @request = Request.find(params[:request_id])
  end

  def create
    # do I have an existing user
    user = User.find_by_email(params[:building][:user][:email])
    # if yes
    if user
      request = user.request
      # does he have a building
      # if yes
      if request.building.floors.count > 0
        Request.find(params[:request_id]).destroy
        redirect_to root_path
      else
        redirect_to new_building_floor_path(@building)
      end
    # if no user
    else
      @user = User.new(user_params)
      @user.request = Request.find(params[:request_id])
      @user.save
    end

    # create building
    @building = Building.new(building_params)
    @building.request = Request.find(params[:request_id])
    @building.save

    redirect_to new_building_floor_path(@building)
  end



  private

  def user_params
    params.require(:building).require(:user).permit(:email)
  end

  def building_params
    params.require(:building).permit(:object_type)
  end
end



