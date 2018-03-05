class BookingsController < ApplicationController
  def create
    booking = params["booking"]
    date = Date.strptime(params["booking"]["date"], "%m/%d/%Y")
    @booking = Booking.new(quote_id: params[:quote_id], date: date)
    @booking.save!
    raise
  end
end
