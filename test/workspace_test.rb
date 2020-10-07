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
