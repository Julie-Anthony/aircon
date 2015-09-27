

class Aircon
  def initialize(input)
    event = Event.new(input)
    event.search
    event.get_location
    event.get_coords
    @airbnb = Airbnb.new(event.latitude, event.longitude)
  end

  def return_hash
    hash[response]= airbnb.get_places
    hash
  end


end
