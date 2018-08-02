require 'test_helper'

class TripsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = participants(:admin)
  end

  test "should get new" do
    log_in_as(@admin)
    get new_trip_path
    assert_response :success
  end
end
