require_relative 'test_helper'

describe "Initializer" do
  before do
    @channel1 = Channel.new(123, "snacks", "ice cream", 5)
  end

  it "is an instance of User" do
    expect(@channel1).must_be_kind_of Channel
  end

  it "username must be a string" do
    expect(@channel1.name).must_be_kind_of String
  end

  it "real name must be a string" do
    expect(@channel1.topic).must_be_kind_of String
  end

  it "Slack ID must be a integer" do
    expect(@channel1.slack_id).must_be_kind_of Integer
  end

  it "member count must be a integer" do
    expect(@channel1.member_count).must_be_kind_of Integer
  end

end

describe "list_all" do

  it "should return all the channels" do
    expect(Channel.list_all.length).must_be 3
  end

  it "return the correct info for the first" do
    expect(Channel.list_all.first.name).must_be "random"
  end

  it "return the correct info for the last" do
    expect(Channel.list_all.last.name).must_be "slack-cli"
  end

end