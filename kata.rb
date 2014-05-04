require 'minitest/autorun'
require 'minitest/pride'

class CalculatorTest < MiniTest::Unit::TestCase

  def setup
    @calc = Calculator.new
  end

  def test_adds_two_numbers
    assert_equal 2, @calc.add(1,1)
    assert_equal 7, @calc.add(5,2)
  end

  def test_adds_three_numbers
    assert_equal 9, @calc.add(3,3,3)
  end

  def test_adds_five_numbers
    assert_equal 25, @calc.add(5,5,5,5,5)
  end

  def test_parses_valid_strings
    assert_equal 3, @calc.add(1, '2')
  end

  def test_numeric_value_of_BANANA
    assert_equal 0, 'BANANA'.to_i
  end

  def test_raises_error_for_invalid_strings
    assert_raises ArgumentError do
      @calc.add(1, 'BANANA')
    end
  end
end

class Calculator

  def add(*numbers)
    numbers.reduce do |v, n|
      if n.to_i === 0 && n != '0' then
        raise ArgumentError
      else
        v + n.to_i
      end
    end
  end
end
