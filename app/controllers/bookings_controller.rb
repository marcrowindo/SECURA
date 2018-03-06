class BookingsController < ApplicationController
  def create
    booking = params["booking"]
    date = Date.strptime(params["booking"]["date"], "%m/%d/%Y")
    quote = Quote.find(params[:quote_id])
    @booking = Booking.new(quote: quote, date: date)
    @booking.amount = quote.price
    @booking.save!
    redirect_to quote_booking_path(quote, @booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
