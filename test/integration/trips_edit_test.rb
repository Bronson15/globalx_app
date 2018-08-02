require 'test_helper'

class TripsEditTest < ActionDispatch::IntegrationTest
  def setup
    @trip = trips(:tester)
  end

  test "unsuccessful edit" do 
    get edit_trip_path(@trip)
    assert_template 'trips/edit'
    patch trip_path(@trip), params: { trip: { name: "",
                                              start_date: "",
                                              end_date: "",
                                              location: ""
                                            }}
    assert_template 'trips/edit'
  end

  test "successful edit" do 
    get edit_trip_path(@trip)
    assert_template 'trips/edit'
    name = "test"
    patch trip_path(@trip), params: { trip: { name: name,
                                              start_date: "2018-01-01",
                                              end_date: "2018-01-02",
                                              location: "AS"
                                           }}
    assert_not flash.empty?
    assert_redirected_to @trip
    @trip.reload
    assert_equal name, @trip.name
  end
end
