require 'test_helper'

class TripsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get trip_new_path
    assert_response :success
  end
end
