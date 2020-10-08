#!/usr/bin/env ruby
require 'httparty'
require_relative 'workspace'
require 'dotenv'
require 'table_print'


def main
  puts "Welcome to the Ada Slack CLI!"
  @workspace = Workspace.new

  loop do
    puts "What would you like to do with CLI? \n1. list users \n2. list channels \n3. select user \n4. select channel \n5. detail\n  (about the selected user or channel) \n6. send message \n7. quit"
    input = gets.chomp

    case input
    when "list users", "1"
      tp @workspace.users
      puts "\n\n"
    when "list channels", "2"
      tp @workspace.channels
      puts "\n\n"
    when "select user", "3"
      select_a_user
    when "select channel", "4"
      select_a_channel
    when "detail", "5"
      tp @workspace.selected
      puts "\n\n"
    when "send message", "6"
      write_message
      puts "\n\n"
    when "quit", "7"
      break
    end
  end


  puts "Thank you for using the Ada Slack CLI"
end

def write_message
  puts "What is your message?"
  message = gets.chomp
  if message == nil
    return false
  end
  puts "Ok, we sent off your message!" if @workspace.send_message(message).parsed_response["ok"] == true
end

def select_a_user
  loop do
    puts "What's the user's slack id or username? enter 6 or quit to exit."
    id_or_name = gets.chomp
    if id_or_name == "6" || id_or_name == "quit"
      break
    end
    begin
      @workspace.select_user(id_or_name)
    rescue Exception
      puts "Please enter a valid username or id.\n\n"
    else
      puts "Ok, #{id_or_name} is selected.\n\n"
      break
    end
  end
end

def select_a_channel
  loop do
    puts "What's the channel's slack id or username? enter 6 or quit to exit."
    id_or_name = gets.chomp
    if id_or_name == "6" || id_or_name == "quit"
      break
    end
    begin
      @workspace.select_channel(id_or_name)
    rescue Exception
      puts "Please enter a valid channel name or id.\n\n"
    else
      puts "Ok, #{id_or_name} is selected.\n\n"
      break
    end
  end
end


main if __FILE__ == $PROGRAM_NAME