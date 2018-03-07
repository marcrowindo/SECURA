class PaymentsController < ApplicationController
  before_action :set_booking

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @booking.amount_cents,
      description:  "Payment for quote #{@booking.quote.supplier_name} for order #{@booking.id}",
      currency:     @booking.amount.currency
    )

    @booking.update(payment: charge.to_json, paid: true)
    raise
    # redirect_to booking_path(@booking)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_booking_payment_path(@booking)
  end

  def show
    
  end

private

  def set_booking
    @booking = Booking.where(paid: false).find(params[:booking_id])
  end
end
