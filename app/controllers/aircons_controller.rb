class AirconsController < ApplicationController

  # +  def index
  # +    # all_recommendations = ArtistRecommendation.new(params[:artist])
  # +    render json: ArtistRecommendation.new(params[:artist]).return_recommendations
  # +  end
  # +
  # +  def show
  # +    render json: ArtistRecommendation.new(params[:artist]).return_one_recommendation
  # +  end


  def index
    aircon = Aircon.new(params[:event])
    render json: aircon.return_hash
  end


end
