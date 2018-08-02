require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @participant = participants(:tester)
    remember(@participant)
  end

  test "current_participant returns right participant when session is nil" do
    assert_equal @participant, current_participant
    assert is_logged_in?
  end

  test "current_participant returns nil when remember digest is wrong" do 
    @participant.update_attribute(:remember_digest, Participant.digest(Participant.new_token))
    assert_nil current_participant
  end
end