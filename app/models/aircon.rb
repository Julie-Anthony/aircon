require 'httparty'

class AirCon
  def initialize(input)
    event = Event.new(input)
    event.search
    event.get_location
    @airbnb = Airbnb.new(event.latitude, event.longitude)
  end

  def whatever
    airbnb.get_places
  end


end
