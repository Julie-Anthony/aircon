

class Aircon
  def initialize(input)
    event = Event.new(input)
    @airbnb = Airbnb.new(event.latitude, event.longitude)
  end

  def return_hash
    hash= {"response" => @airbnb.get_places}
    hash
  end


end
