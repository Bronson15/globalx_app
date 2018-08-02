ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  #boolean for if participant is logged in
  def is_logged_in?
    !session[:participant_id].nil?
  end

  def log_in_as(participant)
    session[:participant_id] = participant_id
  end
end

class ActionDispatch::IntegrationTest

  def log_in_as(participant, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: participant.email,
                                          password: password,
                                          remember_me: remember_me
                                        }}
  end
end
