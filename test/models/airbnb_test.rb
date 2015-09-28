require 'test_helper'
require 'minitest/pride'
require 'airbnb'
require 'aircon'
require 'event'

class Test < Minitest::Test


  def test_classes_exist
    assert Event
    assert Airbnb
    assert Aircon
    assert AirconsController
  end

  def test_initializer_takes_parameter
    assert Event.new("magfest")
    assert Airbnb.new(500, 607)
    assert Aircon.new("magfest")
  end


end
