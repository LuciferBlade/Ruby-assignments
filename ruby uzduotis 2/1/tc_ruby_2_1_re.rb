# frozen_string_literal: true

require_relative 'ruby_2_1_re'
require 'test/unit'

# Unit test class
class TestTypeDefiner < Test::Unit::TestCase
  def test_type_check
    assert_equal('Integer', TypeDefiner.new.type_check('33'))
    assert_equal('Float', TypeDefiner.new.type_check('33.3'))
    assert_equal('Char', TypeDefiner.new.type_check('c'))
    assert_equal('Date', TypeDefiner.new.type_check('10/10/2019'))
    assert_equal('String', TypeDefiner.new.type_check('abcdefghijklmn'))
  end

  def test_reader_input_file
    assert_equal('/home/blade/ruby stuf/ruby uzduotis 2/1/test.txt',
                 TypeDefiner.new.reader_input_file)
  end

  def test_writer_input_file
    a = TypeDefiner.new
    a.writer_input_file('abc')
    assert_equal('abc', a.reader_input_file)
  end

  def test_reader_output_file
    assert_equal('/home/blade/ruby stuf/ruby uzduotis 2/1/output.txt',
                 TypeDefiner.new.reader_output_file)
  end

  def test_writer_output_file
    a = TypeDefiner.new
    a.writer_output_file('abc')
    assert_equal('abc', a.reader_output_file)
  end
end
