require 'httparty'
class Event

  def initialize(input)
    @response_search = get_response_search
    @response_venue_id = get_response_venue_location
    @search_params = search_params
    @latitude = latitude
    @longitude = longitude
    @input = input
  end

  def search
    @search_params = "&q=#{@input}"

  end

  def get_location
    venue_id = @response_search["events"][0]["venue_id"]
    latitude = @response_venue_id["address"]["latitude"].to_i
    longitude = @response_venue_id["address"]["longitude"].to_i

    # This is where we will use @response_search to get the venue_id and then we will use
    # @response_venue_id to use the venue_id to get to venue page to find the latitude and longitude.
  end

  private def get_response_search
    anon_key = ENV['EVENTBRITE_ANON_KEY']
    HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?token=#{anon_key}#{@search_params}")
  end

  private def get_response_venue_location
      personal_key = ENV['EVENTBRITE_PERSONAL_KEY']
    HTTParty.get("https://www.eventbriteapi.com/v3/venues/#{venue_id}/?token=#{personal_key}")
  end
  # We are parsing two different pages, so we need two different instance variables.
end
