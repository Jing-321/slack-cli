require_relative 'recipient'

class User < Recipient
  attr_reader :name, :real_name, :slack_id

  def initialize(slack_id, name, real_name)
    super(slack_id, name)   #super(name)?????
    @real_name = real_name
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

#???????????
 User.list_all.each { |user| puts user.name }