require 'optparse'
require 'pry'
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
end.parse!

unless option[:input]
  puts "Please enter calculation in the following format"
  puts " 45*3-4"
end
  
  calinput = ARGV
  puts eval(calinput.join())
  
