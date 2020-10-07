require_relative 'test_helper'

describe "Initializer" do
  before do
    @user1 = User.new(123, "Totoro", "Ghibli")
  end

  it "is an instance of User" do
    expect(@user1).must_be_kind_of User
  end

  it "username must be a string" do
    expect(@user1.name).must_be_kind_of String
  end

  it "real name must be a string" do
    expect(@user1.real_name).must_be_kind_of String
  end

  it "Slack ID must be a integer" do
    expect(@user1.slack_id).must_be_kind_of Integer
  end

end

describe "list_all" do

  it "should return all the users" do
    expect(User.list_all.length).must_be 5
  end

  it "return the correct info for the first" do
    expect(User.list_all.first.name).must_be "slackbot"
  end

  it "return the correct info for the last" do
    expect(User.list_all.last.name).must_be "api_project"
  end

end