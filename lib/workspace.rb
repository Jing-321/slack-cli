require_relative 'recipient'
require_relative 'user'
require_relative 'channel'
require 'table_print'

class Workspace
  attr_reader :users, :channels
  attr_accessor :selected

  def initialize(users: [], channels: [], selected: nil)
    @users = User.list_all
    @channels = Channel.list_all
    @selected = selected

  end


end
