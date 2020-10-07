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

  it "raise error when slack is or name is missing" do
    expect{Channel.new(123)}.must_raise ArgumentError
    expect{Channel.new(name: "Totoro")}.must_raise ArgumentError
  end

  it "raise error when topic or member count is missing" do
    expect{Channel.new(123, "Totoro", member_count: 5)}.must_raise ArgumentError
    expect{Channel.new(123, "snacks", "ice cream")}.must_raise ArgumentError
  end
end

describe "list_all" do

  it "should return all the channels" do
    VCR.use_cassette("list_all_channels") do
      response = Channel.list_all

      expect(response.length).must_equal 3
    end

  end

  it "return the correct info for the first" do
    VCR.use_cassette("list_all_channels") do
      response = Channel.list_all
      expect(response.first.name).must_equal "random"
    end
  end

  it "return the correct info for the last" do
    VCR.use_cassette("list_all_channels") do
      response = Channel.list_all
      expect(response.last.name).must_equal "slack-cli"
    end
  end

end