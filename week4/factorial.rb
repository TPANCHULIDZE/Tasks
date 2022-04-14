# count factorial of N

ZERO_FACTOTIAL = 1
DECREASE_ONE = -1

class FactorialCounter
  class IntegerError < StandardError; end

  def initialize(number)
    @number ||= number
  end

  def call
    check_validate
    count_factorial(@number.to_i)
  rescue IntegerError => e
    warn e
  end

  private

  def count_factorial(number)
    if number == 0
      ZERO_FACTOTIAL
    else
      count_factorial(number + DECREASE_ONE) * number
    end
  end

  def check_validate
    unless is_non_negative_integer?
      raise IntegerError, "input value must be non-negative integer"
    end
  end

  def is_non_negative_integer?
    @number.to_i.to_s == @number && @number.to_i >= 0
  end
end

puts "please enter non-negative number"
number = gets.chomp

puts FactorialCounter.new(number).call


