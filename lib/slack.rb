#!/usr/bin/env ruby
require 'httparty'
require_relative 'workspace'
require 'dotenv'
require 'table_print'

Dotenv.load
SLACK_TOKEN = ENV['SLACK_TOKEN']

def user_list
  url = "https://slack.com/api/users.list"
  response = HTTParty.get(url, query: {token: SLACK_TOKEN})
  users = []
  response["members"].each do |member|
    users << {name: member["name"], real_name: member["real_name"], id: member["id"]}
  end

  return users
end

def channel_list
  url = "https://slack.com/api/conversations.list"
  response = HTTParty.get(url, query: {token: SLACK_TOKEN})
  channels = []
  response["channels"].each do |channel|
    channels << {channel_name: channel["name"], topic: channel["topic"]["value"], member_count: channel["num_members"], slack_ID: channel["id"]}
  end
  return channels
end

def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new



  loop do
    puts "What would you like to do with CLI? \n1. list users \n2. list channels \n3. quit"
    input = gets.chomp

    if input == "list users" || input == "1"
      tp user_list
      puts "\n\n"
    elsif input == "list channels" || input == "2"
      tp channel_list
      puts "\n\n"
    elsif input == "quit" || input == "3"
      break
    else
      puts "Please choose one of the options."
    end
  end


  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME