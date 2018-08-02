require 'test_helper'

class TripTest < ActiveSupport::TestCase
      
  def setup
    @trip = Trip.new(name: "test", start_date: "2018-01-01", end_date: "2018-01-31", location: "TA")
  end

  test "should be valid" do 
    assert @trip.valid?
  end

  test "name should be present" do 
    @trip.name = ""
    assert_not @trip.valid?
  end

  test "start_date should be present" do 
    @trip.start_date = ""
    assert_not @trip.valid?
  end

  test "end_date should be present" do 
    @trip.end_date = ""
    assert_not @trip.valid?
  end

  test "location should be present" do 
    @trip.location = ""
    assert_not @trip.valid?
  end
end
