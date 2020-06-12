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

# unless option[:input]
#   puts "Please enter calculation in the following format"
#   puts "45*3-4"
# end
#   
  cal_input = ARGV

if cal_input 
  first = cal_input.join()
  operator = op(first)
  first_result = eval(first)
  next_input = "0"
  while next_input != operator+'q' do 
    puts "====>#{first_result}"
    puts operator
    next_input = STDIN.gets.chomp

    next_operator = op(next_input)
    unless next_operator.empty?
      operator = next_operator
    else
      next_input = operator+next_input
    end
    # if next_input != 'q'
    if next_input != operator+'q'
      first_result = eval(first_result.to_s + next_input)
    else
      puts "Bye"
    end
  end
end
