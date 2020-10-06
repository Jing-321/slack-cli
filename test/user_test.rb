require_relative 'test_helper'

describe "Initializer" do
  before do
    @user1 = User.new(123, "Totoro", "Ghibli")
  end

  it "is an instance of User" do
    expect(@user1).must_be_kind_of User
  end

  it "username must be a string" do
    expect(@user1.user_name).must_be_kind_of String
  end

  it "real name must be a string" do
    expect(@user1.real_name).must_be_kind_of String
  end

  it "Slack ID must be a integer" do
    expect(@user1.slack_id).must_be_kind_of Integer
  end

end