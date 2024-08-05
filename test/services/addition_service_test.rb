require 'test_helper'

class AdditionServiceTest < ActiveSupport::TestCase

  def test_should_add_numbers
    sum = AdditionService.new("1,2").process
    assert_equal 3, sum
  end
end
