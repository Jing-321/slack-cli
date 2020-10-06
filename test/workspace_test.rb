require_relative 'test_helper'

describe "Initializer" do
  it "is an instance of Workspace" do
    expect(Workspace.new).must_be_kind_of Workspace
  end

  it "uses must be an empty array" do
    workspace1 = Workspace.new
    expect(workspace1.users).must_be_kind_of Array
    expect(workspace1.users).must_be_empty
  end

  it "channels must be an empty array" do
    workspace1 = Workspace.new
    expect(workspace1.channels).must_be_kind_of Array
    expect(workspace1.channels).must_be_empty
  end

end
