class Workspace
  attr_reader :users, :channels

  def initialize(users: [], channels: [])
    @users = users
    @channels = channels
  end

end