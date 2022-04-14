# calculate sum of even fibonacci numbers before N

MAX_NUMBER = 100

class FibonacciNumber
  class IntegerError < StandardError; end

  def initialize(number)
    @number = number
  end

  def call  
    check_validate
    calculate_sum
  rescue IntegerError => e
    e.message
  end

  private 

  def calculate_sum
    return 0 if @number.to_i == 1
    fibonacci_numbers
    @fibonacci_numbers_array.inject(0) { |sum, number|  number.even? ? sum + number : sum }
  end

  def fibonacci_numbers
    @fibonacci_numbers_array ||= [0,1]
    quantity = @number.to_i - 2
    quantity.times { |_| @fibonacci_numbers_array << back_sum_last_two_element }
  end

  def back_sum_last_two_element
    @fibonacci_numbers_array.last + @fibonacci_numbers_array[-2]
  end

  def check_validate
    return  if is_positive_integer_less_than_100?

    raise IntegerError, "input value must be positive number but less than 100"
  end

  def is_positive_integer_less_than_100?
    @number.to_i.to_s == @number && @number.to_i.positive? && @number.to_i <= MAX_NUMBER
  end

end

# puts "enter positive integer less than or equal 100"
# number = gets.chomp

# puts FibonacciNumber.new(number).call