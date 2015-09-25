class AirbnbsController < ApplicationController

  def index
    render json: Airbnb.all
  end

  
end
