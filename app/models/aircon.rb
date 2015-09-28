

class Aircon
  def initialize(input)
    event = Event.new(input)
    @airbnb = Airbnb.new(event.latitude, event.longitude)
  end

  def return_hash
  @airbnb.array
  end


end
