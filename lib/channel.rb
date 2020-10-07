require_relative 'recipient'

class Channel < Recipient
  attr_reader :name, :topic, :member_count, :slack_id

  def initialize(slack_id, name, topic, member_count)
    super(slack_id, name)
    @topic = topic
    @member_count = member_count

    raise ArgumentError, "slack ID, name, topic, and member count are all required." unless topic || member_count
  end

  def self.list_all
    response = self.get("https://slack.com/api/conversations.list")
    channels = []
    response["channels"].each do |channel|
      channels << Channel.new(channel["id"], channel["name"], channel["topic"]["value"], channel["num_members"])
    end
    return channels
  end

end