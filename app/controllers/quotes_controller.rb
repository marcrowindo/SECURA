class QuotesController < ApplicationController

  def index
    @quotes = Quote.where(request_id: params[:request_id])
  end

  def show
    @quote = Quote.find(params[:id])
    if (params[:token].present?) && (params[:token] == @quote.token)
      @request = @quote.request
      @user = @request.user
      @booking = Booking.new
    else
      flash[:not_allowed] = 'That is not your quote!'
      redirect_to root_path
    end
  end
end
