require 'test_helper'

class LeadersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get leaders_new_url
    assert_response :success
  end

end
