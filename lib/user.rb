require_relative 'recipient'

class User < Recipient
  attr_reader :name, :real_name, :slack_id

  def initialize(slack_id, name, real_name)
    super(slack_id, name)   #super(name)?????
    @real_name = real_name

    #raise ArgumentError, "real name is required." unless real_name
  end

  def self.list_all
    response = self.get("https://slack.com/api/users.list")
    users = []
    response["members"].each do |member|
      users << User.new(member["id"], member["name"], member["real_name"])
    end
    return users
  end
end

tp User.new(1, "a", "ada").list_all