class UsersController < ApplicationController
  def edit
  end

  def update
  end

  def show
    @user = User.find(params[:id])
    @request = Request.find(@user.request.id)
  end
end
