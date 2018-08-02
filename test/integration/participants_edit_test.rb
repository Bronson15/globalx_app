require 'test_helper'

class ParticipantsEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @participant = participants(:tester)
  end

  test "unsuccessful edit" do 
    log_in_as(@participant)
    get edit_participant_path(@participant)
    assert_template 'participants/edit'
    patch participant_path(@participant), params: { participant: { first_name: "",
                                                                     last_name: "",
                                                                     email: "bad@invalid",
                                                                     phone_number: "",
                                                                     address: "",
                                                                     address2: "",
                                                                     city: "",
                                                                     state: "",
                                                                     zip: "",
                                                                     birthdate: "",
                                                                     password: "short",
                                                                     password_confirmation: "different"
                                                                   }}
    assert_template 'participants/edit'
  end

  test "successful edit" do 
    get edit_participant_path(@participant)
    log_in_as(@participant)
    assert_redirected_to edit_participant_url(@participant)    
    first_name = "test"
    last_name = "test"
    patch participant_path(@participant), params: { participant: { first_name: first_name,
                                                                   last_name: last_name,
                                                                   email: "IntegrationTest@participant.com",
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
    assert_redirected_to @participant
    @participant.reload
    assert_equal first_name, @participant.first_name
    assert_equal last_name, @participant.last_name
  end
end
