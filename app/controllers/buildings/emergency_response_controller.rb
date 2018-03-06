class Buildings::EmergencyResponseController < ApplicationController

  def new
    @building = Building.find(params[:building_id])
    @request = @building.request
  end

  def create
    @building = Building.find(params[:building_id])
    @request = Request.find(@building.request_id)
    id = params[:building_id]
    @building.update(emergency_response: params["/buildings/#{id}/emergency_response?method=patch"]["emergency_response"])
    request = @building.request
    request.set_price_min
    request.set_price_max
    Quote.all.each do |quote|
      quote.request = @request
      quote.price = @request.price_min + rand(0..500)
      quote.save
    end
    request.save
    UserMailer.quotes(@building.request.user).deliver_now
    redirect_to request_path(@request)
  end
end
