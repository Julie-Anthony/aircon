require 'httparty'
class Event

  def initialize
    @response_search = get_response_search
    @response_venue_id = get_response_venue_location
    @search_params = search_params
  end

  def search
    puts "Enter search query for your event: "
    input = gets.chomp
    @search_params = "&q=#{input}"

  end

  def get_location
    # This is where we will use @response_search to get the venue_id and then we will use
    # @response_venue_id to use the venue_id to get to venue page to find the latitude and longitude.
  end

  private def get_response_search
    key = ENV['EVENTBRITE_KEY']
    HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?token=#{key}#{@search_params}")
  end

  private def get_response_venue_location
    anon_key = ENV['EVENTBRITE_ANON_KEY']
    HTTParty.get("https://www.eventbriteapi.com/v3/venues/#{venue_id}/?token=#{anon_key}")
  end
  # We are parsing two different pages, so we need two different instance variables.
end
