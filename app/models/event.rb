require 'httparty'
class Event

  def initialize
    @response = get_response
  end

  private def get_response
    key = ENV['EVENTBRITE_KEY']
    HTTParty.get("https://www.eventbrite.com/oauth/authorize?response_type=code&client_id=#{key}")
  end


end
