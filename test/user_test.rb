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

  it "raise error when slack is or name is missing" do
    expect{User.new(123)}.must_raise ArgumentError
    expect{User.new(name: "Totoro")}.must_raise ArgumentError
  end

  it "raise error when real name is missing" do
    expect{User.new(123, "Totoro")}.must_raise ArgumentError
  end

end

describe "list_all" do

  it "should return all the users" do
    VCR.use_cassette("list_all_users") do
      response = User.list_all
      expect(response.length).must_equal 5
    end
  end

  it "return the correct info for the first" do
    VCR.use_cassette("list_all_users") do
      response = User.list_all
      expect(response.first.name).must_equal "slackbot"
    end
  end

  it "return the correct info for the last" do
    VCR.use_cassette("list_all_users") do
      response = User.list_all
      expect(response.last.name).must_equal "api_project"
    end
  end

end