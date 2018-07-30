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
end
