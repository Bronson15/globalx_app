require 'test_helper'

class ParticipantsLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @participant = participants(:tester)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do 
    get login_path
    post login_path, params: { session: { email: @participant.email, password: 'password' } }
    assert_redirected_to @participant
    follow_redirect!
    assert_template 'participants/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", participant_path(@participant)
  end

  test "login with valid information followed by logout" do 
    get login_path
    post login_path, params: { session: { email: @participant.email, password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @participant
    follow_redirect!
    assert_template 'participants/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", participant_path(@participant)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,                     count: 0
    assert_select "a[href=?]", participant_path(@participant),  count: 0
  end
end
