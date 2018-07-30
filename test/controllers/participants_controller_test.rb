require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get participant_signup_path
    assert_response :success
  end

end
