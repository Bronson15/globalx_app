require 'test_helper'

class ParticipantsSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do 
    get participant_signup_path 
    assert_no_difference 'Participant.count' do 
    post participants_path, params: { participant: { first_name: "",
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
    end
    assert_template 'participants/new'
  end

  test "valid signup information" do 
    get participant_signup_path
    assert_difference 'Participant.count', 1 do 
      post participants_path, params: { participant: { first_name: "Test",
                                                       last_name: "Participant",
                                                       email: "integrationtest@participant.com",
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
    end
    follow_redirect!
    assert_template 'participants/show'
    assert is_logged_in?
  end
end
