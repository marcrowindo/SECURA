class BookingsController < ApplicationController
  def create
    booking = params["booking"]
    date = Date.new booking["date(1i)"].to_i, booking["date(2i)"].to_i, booking["date(3i)"].to_i
    @booking = Booking.new(quote_id: params[:quote_id], date: date)
    @booking.save!
    raise
  end
end
