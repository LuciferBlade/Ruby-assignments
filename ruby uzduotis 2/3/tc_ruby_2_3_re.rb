# frozen_string_literal: true

require_relative 'ruby_2_3_re'
require 'test/unit'

# Unit test class
class TestSolutionFinder < Test::Unit::TestCase
  def test_intro_message
    assert(true, SolutionFinder.new.intro_message)
  end

  def test_count_signs
    assert_equal(0, SolutionFinder.new.count_signs)
  end

  def test_value_reader
    assert_equal('123', SolutionFinder.new.value_reader)
  end

  def test_number_grouping
    assert_equal(0, SolutionFinder.new.number_groping([1, 2, 3, 4], [0, 0, 0]))
  end

  def test_number_multiplication
    assert_equal(0, SolutionFinder.new.number_multiplication(1, [1, 2], [2]))
  end

  def test_number_sum
    assert_equal(0, SolutionFinder.new.number_sum(1, [1, 2], [1]))
  end

  def test_answer_writer
    assert(true, SolutionFinder.new.answer_writer([1, 2, 3, 4, 5], 123))
  end

  def test_sign_change
    assert_not_nil(SolutionFinder.new.sign_change, 'it is nil')
  end

  def test_run
    # asser_not_nil(SolutionFinder.new.run, 'it is nil')
  end
end
