require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
    
  def setup
    @participant = participants(:tester)
    @other_participant = participants(:tester2)
  end 

  test "should get new" do
    get participant_signup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do 
    get edit_participant_path(@participant)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do 
    patch participant_path(@participant), params: { participant: { first_name: "test",
                                                                   last_name: "test",
                                                                   email: "test2@participant.com",
                                                                   phone_number: "1234567890",
                                                                   address: "123 Test Street",
                                                                   address2: "",
                                                                   city: "Test",
                                                                   state: "GA",
                                                                   zip: "30004",
                                                                   birthdate: "2000-01-01",
                                                                   password: "password",
                                                                   password_confirmation: "password"
                                                                 }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do 
    log_in_as(@other_participant)
    get edit_participant_path(@participant)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do 
    log_in_as(@other_participant)
    patch participant_path(@participant), params: { participant: { first_name: "test",
                                                                   last_name: "test",
                                                                   email: "test2@participant.com",
                                                                   phone_number: "1234567890",
                                                                   address: "123 Test Street",
                                                                   address2: "",
                                                                   city: "Test",
                                                                   state: "GA",
                                                                   zip: "30004",
                                                                   birthdate: "2000-01-01",
                                                                   password: "password",
                                                                   password_confirmation: "password"
                                                                 }}
    assert flash.empty?
    assert_redirected_to root_url
  end
end
