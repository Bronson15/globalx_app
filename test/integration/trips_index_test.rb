require 'test_helper'

class TripsIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @trip = trips(:tester)
  end

  test "index including pagination" do 
    get trips_path
    assert_template 'trips/index'
    assert_select 'div.pagination'
    Trip.paginate(page: 1).each do |trip|
      assert_select 'a[href=?]', trip_path(trip), tet: trip.name
    end
  end
end
