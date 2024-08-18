require 'test_helper'

class AdditionServiceTest < ActiveSupport::TestCase

  def test_should_add_numbers
    sum = AdditionService.new("1,2").process
    assert_equal 3, sum
  end

  def test_should_return_zero_if_input_string_is_empty
    sum = AdditionService.new("").process
    assert_equal 0, sum
  end

  def test_should_handle_new_lines_between_numbers
    sum = AdditionService.new("1\n2,3").process
    assert_equal 6, sum
  end

  def test_should_support_custom_delimiter
    sum = AdditionService.new("//;\n1;2;3;4").process
    assert_equal 10, sum
  end

  def test_should_throw_error_if_negative_number_present
    error = assert_raises NegativeNumberException do
      AdditionService.new("//;\n1;-2;3;-4").process
    end
    error_message = 'negative numbers not allowed -2, -4'
    assert_equal error_message, error.message
  end
end
