require_relative 'test_helper'

describe "Initializer" do
  before do
    @recipient1 = Recipient.new(123, "Totoro")
  end

  it "is an instance of User" do
    expect(@recipient1).must_be_kind_of Recipient
  end

  it "username must be a string" do
    expect(@recipient1.name).must_be_kind_of String
  end

  it "Slack ID must be a integer" do
    expect(@recipient1.slack_id).must_be_kind_of Integer
  end

  it "raise error when slack is or name is missing" do
    expect{Recipient.new(123)}.must_raise ArgumentError
    expect{Recipient.new(name: "Totoro")}.must_raise ArgumentError
  end
end