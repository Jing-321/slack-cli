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

describe "send_message" do
  before do
      @recipient1 = Recipient.new("C01C16GNVMZ","random")
      @message = "Test Message"
    # end
  end

  it "successfully sends a message" do
    VCR.use_cassette("recipient_send_message") do
      expect(Recipient.send_message(@recipient1.slack_id, @message).parsed_response["ok"]).must_equal true
    end
  end

  it "raise an error if message is nil" do
    @message = nil
    expect{@recipient1.send_message(@message)}.must_raise Exception
  end

end