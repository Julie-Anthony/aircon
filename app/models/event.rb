
class Event

  def initialize(search_params)
    @search_params = search_params
    # search
    @response_search = get_response_search
    @venue_id = ""
    get_location
    @response_venue_id = get_response_venue_location
    @latitude = ""
    @longitude = ""
    get_coords
  end

  def latitude
    @latitude
  end

  def longitude
    @longitude
  end

  # def search
  #   # @search_params = "&q=#{@search_params}"
  #   @search_params = "bacon"
  # end

  def get_location
    @venue_id = @response_search["events"][0]["venue_id"]
  end

  def get_coords
    @latitude = @response_venue_id["address"]["latitude"]
    @longitude = @response_venue_id["address"]["longitude"]
    # This is where we will use @response_search to get the venue_id and then we will use
    # @response_venue_id to use the venue_id to get to venue page to find the latitude and longitude.
  end

  private

  def get_response_search
    anon_key = ENV['EVENTBRITE_ANON_KEY']
    HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?token=#{anon_key}&q=#{@search_params}")
  end

  def get_response_venue_location
      personal_key = ENV['EVENTBRITE_PERSONAL_KEY']
    HTTParty.get("https://www.eventbriteapi.com/v3/venues/#{@venue_id}/?token=#{personal_key}")
  end
  # We are parsing two different pages, so we need two different instance variables.
end
