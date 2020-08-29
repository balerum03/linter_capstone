one_array = []
two_array = []
keywords = %w[class def if elsif for while]
my_file = File.open("tester.rb", "r")
  my_file.readlines().each_with_index do |lines, line_index|
    if lines.match('do').to_s == "do"
      one_array << line_index
    end
    if lines.match('end').to_s == "end"
      two_array << line_index
    end
  end

  p one_array
  p two_array

if one_array.length > two_array.length
  total_missed = one_array.length - two_array.length
  puts "You are missing #{total_missed} end"
elsif one_array.length < two_array.length
  total_missed = two_array.length - one_array.length
  puts "You are missing #{total_missed} do"
elsif one_array.length == two_array.length
  puts 'good job dude'
end

my_file.close()
