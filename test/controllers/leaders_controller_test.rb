require 'test_helper'

class LeadersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get leader_signup_path
    assert_response :success
  end

end
