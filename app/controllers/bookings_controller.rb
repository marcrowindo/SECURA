class BookingsController < ApplicationController

  def create
    booking = params["booking"]
    date = Date.strptime(params["booking"]["date"], "%m/%d/%Y")
    quote = Quote.find(params[:quote_id])
    @booking = Booking.new(quote: quote, date: date)
    @booking.percent_price = quote.price * 0.2
    @booking.amount = @booking.percent_price
    @booking.save!
    redirect_to new_quote_booking_payment_path(quote, @booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
