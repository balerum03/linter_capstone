class Checker
  attr_writer :open_index, :close_index, :receiver
  attr_reader :open_index, :close_index, :receiver, :my_file

  def initialize(filepath)
    @my_file = filepath
    @error_index = []
  end

  def file_checker(opener, closer)
    @error_index = []
    opened = File.open(@my_file)
    opened.readlines.each_with_index do |lines, line_index|
      if lines.rindex(opener).to_i > lines.rindex(closer).to_i
        @error_index << line_index
      end
      if lines.rindex(opener).nil? && !lines.rindex(closer).nil?
        @error_index << line_index
      end
    end
    opened.close
    @error_index
  end
end
