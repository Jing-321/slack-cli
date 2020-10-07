require 'httparty'
require_relative 'workspace'
require 'dotenv'
require 'table_print'

class Recipient
  Dotenv.load ##inside or outside?
  BASE_URL = "https://slack.com/api/"
  SLACK_TOKEN = ENV['SLACK_TOKEN']

  attr_reader :slack_id, :name

  def initialize(slack_id, name)#should we get rid of name????
    @slack_id = slack_id
    @name = name

  raise ArgumentError, "slack ID and name are required." unless slack_id || name
  end

  def self.get(url)
    return HTTParty.get(url, query: {token: SLACK_TOKEN})
  end

  def self.list_all
    raise NotImplementedError, 'Implement me in a child class!'
  end


end