require_relative 'test_helper'

describe "Initializer" do
  before do
    VCR.use_cassette("list_all_users_and_channels_for_workspace") do
      @workspace1 = Workspace.new
    end
  end

  it "is an instance of Workspace" do
    expect(@workspace1).must_be_kind_of Workspace
  end

  it "uses must be an array" do
    expect(@workspace1.users).must_be_kind_of Array
  end

  it "channels must be an array" do
    expect(@workspace1.channels).must_be_kind_of Array
  end

end

describe "select user or channel" do
  before do
    VCR.use_cassette("list_all_users_and_channels_for_workspace") do
      @workspace1 = Workspace.new
    end
  end
  it "return correct user" do
    expect(@workspace1.select_user("yjlin789")).must_be_kind_of User
    expect(@workspace1.select_user("yjlin789").name).must_equal "yjlin789"
    expect(@workspace1.select_user("USLACKBOT").name).must_equal "slackbot"
  end
  it "return correct channel" do
    expect(@workspace1.select_channel("random")).must_be_kind_of Channel
    expect(@workspace1.select_channel("random").name).must_equal "random"
    expect(@workspace1.select_channel("C01C761G84U").name).must_equal "general"
  end
end

describe "send_message" do
  before do
    VCR.use_cassette("list_all_users_and_channels_for_workspace") do
      @workspace1 = Workspace.new
      @message = "Test Message"
      @workspace1.selected = Recipient.new("C01C16GNVMZ","random")
    end
  end

  it "successfully sends a message to a channel" do
    VCR.use_cassette("send_message_to_channel") do
      expect(@workspace1.send_message(@message).parsed_response["ok"]).must_equal true
    end
  end

  it "successfully sends a message to a user" do
    VCR.use_cassette("send_message_to_user") do
      @workspace1.selected = Recipient.new("U01C10G57NE","rencarothers")
      expect(@workspace1.send_message(@message).parsed_response["ok"]).must_equal true
    end
  end

  it "raise an error if message is nil" do
    @message = nil
    expect{@workspace1.send_message(@message)}.must_raise Exception
  end

  it "if user or channel is not selected, raises an error" do
    @workspace1.selected = nil
    expect{@workspace1.send_message(@message)}.must_raise Exception
  end

end
