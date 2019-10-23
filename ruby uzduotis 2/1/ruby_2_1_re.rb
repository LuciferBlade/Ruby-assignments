# frozen_string_literal: true

# Class which defines which variable type the string is in specified file
class TypeDefiner
  @input_file = ''
  @output_file = ''

  def initialize
    @input_file = '/home/blade/ruby stuf/ruby uzduotis 2/1/test.txt'
    @output_file = '/home/blade/ruby stuf/ruby uzduotis 2/1/output.txt'
  end

  def type_check(var)
    if var.match(/^[-]?\d+?$/)
      'Integer'
    elsif var.match(/^[-]?(\d+)+[.]\d+?$/)
      'Float'
    elsif var.size == 1
      'Char'
    elsif var.match(%r{^(0?[1-9]|1[0-2])?[\/](0?[1-9]|[12]\d|3[01])?[\/]\d{4}$})
      'Date'
    else
      'String'
    end
  end

  def reader_input_file
    @input_file
  end

  def writer_input_file(path)
    @input_file = path
  end

  def reader_output_file
    @output_file
  end

  def writer_output_file(path)
    @output_file = path
  end

  def run
    file1 = File.new(@input_file, 'r')
    file2 = File.new(@output_file, 'w')

    file1.each do |line|
      parts = line.split(',')
      parts.each do |i|
        file2.print type_check(i)
        file2.print(',') if i != parts.last
      end
      file2.puts('')
    end

    puts 'done'

    file2.close
    file1.close
  end
end

a = TypeDefiner.new
a.run
