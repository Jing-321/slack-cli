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

  def select_user(name_or_id)
    @selected = @users.find {|user| user.slack_id == name_or_id}
    @selected = @users.find {|user| user.name == name_or_id} unless @selected
    raise Exception.new("no user found.") unless @selected
    return @selected
  end

  def select_channel(name_or_id)
    @selected = @channels.find {|channel| channel.slack_id == name_or_id}
    @selected = @channels.find {|channel| channel.name == name_or_id} unless @selected
    raise Exception.new("no channel found.") unless @selected
    return @selected
  end

  def send_message(message)
    raise Exception.new("nothing selected, please select a user/channel to send to first!") if @selected == nil
    channel = @selected.slack_id
    Recipient.send_message(channel, message)
    return true
  end
end

