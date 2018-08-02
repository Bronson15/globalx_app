require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase
  def setup
    @participant = Participant.new(first_name: "Test", last_name: "Test", email: "test@test.com",
                                    phone_number: "1234567890", address: "123 Road", address2: "",
                                    city: "Test", state: "GA", zip: "12345", birthdate: "2000-01-01",
                                    password: "testing", password_confirmation: "testing")
  end

  test "should be valid" do 
    assert @participant.valid?
  end

  test "name should be present" do 
    @participant.first_name = "     "
    @participant.last_name  = "     "
    assert_not @participant.valid?
  end

  test "name should not be too long" do
    @participant.first_name = "a" * 26
    @participant.last_name = "a" * 26
    assert_not @participant.valid?
  end

  test "email should be present" do 
    @participant.email = "     "
    assert_not @participant.valid?
  end

  test "email should not be too long" do
    @participant.email = "a" * 255 + "@test.com"
    assert_not @participant.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[test@test.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @participant.email = valid_address
      assert @participant.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_participant = @participant.dup
    duplicate_participant.email = @participant.email.upcase
    @participant.save
    assert_not duplicate_participant.valid?
  end

  test "phone_number should be present" do 
    @participant.phone_number = "     "
    assert_not @participant.valid?
  end

  test "phone_number should not be too long" do
    @participant.phone_number = "a" * 11
    assert_not @participant.valid?
  end

  test "address should be present" do 
    @participant.address = "     "
    assert_not @participant.valid?
  end

  test "address should not be too long" do
    @participant.address = "a" * 256
    assert_not @participant.valid?
  end

  test "city should be present" do 
    @participant.city = "     "
    assert_not @participant.valid?
  end

  test "city should not be too long" do
    @participant.city = "a" * 256
    assert_not @participant.valid?
  end

  test "state should be present" do 
    @participant.state = "     "
    assert_not @participant.valid?
  end

  test "state should not be too long" do
    @participant.state = "a" * 3
    assert_not @participant.valid?
  end

  test "zip should be present" do 
    @participant.zip = "     "
    assert_not @participant.valid?
  end

  test "zip should not be too long" do
    @participant.zip = "a" * 6
    assert_not @participant.valid?
  end

  test "birthdate should be present" do 
    @participant.birthdate = "     "
    assert_not @participant.valid?
  end

  test "password should be present (nonblank)" do 
    @participant.password = @participant.password_confirmation = " " * 6
    assert_not @participant.valid?
  end

  test "password should have a minimum length" do 
    @participant.password = @participant.password_confirmation = " " * 5
    assert_not @participant.valid?
  end

  test "authenticated? should return false for a participant with nil digest" do 
    assert_not @participant.authenticated?('')
  end

end
