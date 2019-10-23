# frozen_string_literal: true

input_file = '/home/blade/ruby stuf/ruby uzduotis 2/1/test.txt'
# 1500000 Sales Records.csv'#
output_file = '/home/blade/ruby stuf/ruby uzduotis 2/1/output.txt'

file1 = File.new(input_file, 'r')
file2 = File.new(output_file, 'w')

file1.each do |line|
  parts = line.split(',')
  parts.each do |i|
    if i.match(/^[-]?\d+?$/)
      file2.print 'Integer'
    elsif i.match(/^[-]?(\d+)+[.]\d+?$/)
      file2.print 'Float'
    elsif i.size == 1
      file2.print 'Char'
    elsif i.match(%r{^(0?[1-9]|1[0-2])?[\/](0?[1-9]|[12]\d|3[01])?[\/]\d{4}$})
      file2.print 'Date'
    else
      file2.print 'String'
    end
    file2.print(',') if i != parts.last
  end
  file2.puts('')
end

puts 'done'

file2.close
file1.close
