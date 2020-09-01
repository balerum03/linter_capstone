require 'colorize'
open_array = []
close_array = []
hello = /\[/
hello2 = /\]/
my_file = File.open("tester.rb", "r")
  my_file.readlines().each_with_index do |lines, line_index|
    if lines.match(hello)
      open_array << line_index
    end
    if lines.match(hello2)
      close_array << line_index
    end
  end

  close_counter = open_array + close_array

  if open_array.length > close_array.length
    close_counter = close_counter - close_array
  elsif open_array.length < close_array.length
    open_counter = close_counter - open_array
  end 

    close_counter.uniq!
    open_counter = close_counter
    close_counter = close_counter - close_array
    open_counter = open_counter - open_array

  if close_counter.empty? && open_counter.empty?
    puts "Everything looks good".colorize(:green)
  end
  if !close_counter.nil?
    close_counter.each do |error_index|
      puts "Check this line #{error_index + 1}, you could be missing something".colorize(:red)
    end
  end
  if !open_counter.nil?
    open_counter.each do |error_index|
      puts "Check this line #{error_index + 1}, you could be missing something".colorize(:red)
    end
  end

my_file.close()
