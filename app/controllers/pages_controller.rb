class PagesController < ApplicationController
  def home
    @request = Request.new
  end
end
