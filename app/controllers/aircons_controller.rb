class AirconsController < ApplicationController


  def index
    @event = params[:event]
    render json: Aircon.new(params[:event]).return_hash
  end


end
