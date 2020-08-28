i=0
j=0
error_position=[]
my_file = File.open("tester.rb", "r")
  my_file.readlines().each_with_index do |lines, line_index|
    if lines.match('do')
      i+=1
    elsif lines.match('end')
      j+=1
    end
  end
  errors_found = i<=>j
  if errors_found == -1
    puts 'you are missing a do'
  elsif errors_found == 0
    puts 'no errors found'
  elsif errors_found == 1
    puts 'you are missing a end'
  end

my_file.close()
