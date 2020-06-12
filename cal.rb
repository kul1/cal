# Developer: Prateep Kul

require 'optparse'
require 'pry'
require './cal_helper'
include CalHelper

ARGV << '-h' if ARGV.empty?
# This will hold the options we parse
option = {}
OptionParser.new do |parser|
  parser.banner = "Usage: ruby cal.rb [options]"

  parser.on("-h", "--help", "Help for this calculator") do | |
    puts parser
    exit
  end

  # Whenever we see on -n or --n, with an argument, save the argument
  parser.on("-i", "--ii", "Input") do |i|
    option[:input] = i
  end
  # Option default operator eg: + or *
  # This option will display each line
  # Overwrite by each operation
  parser.on("-o", "--oo", "Default operator:TODO Next Version") do |o|
    # if o.include?"+-*/"
    # option[:operator] = o
    # end

  end
end.parse!
cal_input = ARGV

if cal_input 
  first = cal_input.join()
  operator = op(first)
  first_result = eval(first)
  puts first_result
  puts operator
  # while next_input != operator+'q' do 
  while input = STDIN.gets.chomp
    next_input = "0"
    next_operator = op(input)
    unless next_operator.empty?
      operator = next_operator
      next_input = input
    else
      if input.empty?
        next_input = input
      else 
        next_input = operator+input
      end
    end
    case 
    when input.downcase == 'q'  
      puts "Bye q"
      break
      binding.pry
    when (input.to_i != 0) || (operator == '/' || '*')
      begin
        first_result = eval(first_result.to_s + next_input)
      rescue Exception => exe
        puts "RESCUED! Invalid data input"
      end
        puts "====> #{first_result}"
        puts operator
        next_operator = op(next_input)
        unless next_operator.empty?
          operator = next_operator
        else
          next_input = operator+next_input
        end
    else
        puts "Invalid input: "
        puts "====> #{first_result}"
        puts operator
    end
  end
    puts "quit"
end

