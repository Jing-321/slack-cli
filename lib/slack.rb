#!/usr/bin/env ruby
require 'httparty'
require_relative 'workspace'
require 'dotenv'

Dotenv.load
SLACK_TOKEN = ENV['SLACK_TOKEN']

def user_list
  url = "https://slack.com/api/users.list"
  return HTTParty.get(url, query: {token: SLACK_TOKEN})
end

def channel_list
  url = "https://slack.com/api/conversations.list"
  return HTTParty.get(url, query: {token: SLACK_TOKEN})
end

def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new

  # TODO project
  puts "What would you like to do with CLI? 1. list users, 2. list channels, 3. quit"
  input = gets.chomp

  loop do
    if input == "list users" || input == "1"
      puts user_list
    elsif input == "list channels" || input == "2"
      puts channel_list
    elsif input == "quit" || input == "3"
      break
    else
      puts "Please choose one of the options."
    end
    input = gets.chomp
  end


  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME