class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.save!
    redirect_to new_request_building_path(@request)
  end

  def edit
  end

  def update
  end

  private 

  def request_params
    params.require(:request).permit(:zip_code)
  end
end
