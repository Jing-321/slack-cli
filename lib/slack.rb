#!/usr/bin/env ruby
require 'httparty'
require_relative 'workspace'
require 'dotenv'
require 'table_print'


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