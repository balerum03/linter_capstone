class Checker
  def initialize(filepath)
    @my_file = filepath
    @error_index = []
  end

  def file_checker(opener, closer)
    @error_index = []
    opened = File.open(@my_file)
    opened.readlines.each_with_index do |lines, line_index|
      @error_index << line_index if lines.scan(opener).count != lines.scan(closer).count
      @error_index << line_index if lines.rindex(opener).to_i > lines.rindex(closer).to_i
      @error_index << line_index if lines.rindex(opener).nil? && !lines.rindex(closer).nil?
    end
    opened.close
    @error_index.uniq
  end
end
