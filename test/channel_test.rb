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