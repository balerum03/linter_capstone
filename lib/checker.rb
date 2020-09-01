class Checker
  attr_writer :open_index, :close_index, :receiver
  attr_reader :open_index, :close_index, :receiver, :my_file

  def initialize(filepath)
    @my_file = filepath
    @open_index = []
    @close_index = []
  end

  def file_checker(opener, closer)
    @open_index = []
    @close_index = []
    opened = File.open(@my_file)
    opened.readlines.each_with_index do |lines, line_index|
      @open_index << line_index if lines.match(opener)
      @close_index << line_index if lines.match(closer)
    end
    opened.close
    [@open_index, @close_index]
  end

  def file_analizer(arg_to_check1, arg_to_check2)
    @receiver = file_checker(arg_to_check1, arg_to_check2)
    open_array = @receiver[0]
    close_array = @receiver[1]
    close_counter = open_array + close_array
    close_counter -= close_array if open_array.length > close_array.length
    close_counter.uniq!
    open_counter = close_counter
    close_counter -= close_array
    open_counter -= open_array
    [open_counter, close_counter]
  end
end
