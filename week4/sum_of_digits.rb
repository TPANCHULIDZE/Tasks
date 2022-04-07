# calculate sum of every digits in number1..number2 

DIVISION_CONST = 2
ADD_ONE = 1

class CalculateSumOfDigits
  class IntegerError < StandardError; end

  def initialize(number1, number2)
    @number1, @number2 = number1, number2
  end

  def call
    check_validate
    convert_numbers_to_i
    calculate_sum
  rescue IntegerError => e
    warn e
  end

  private

  def convert_numbers_to_i
    @number1, @number2 = [@number1.to_i, @number2.to_i].sort
  end

  def calculate_sum
    ((@number1 + @number2) * (@number2 - @number1 + ADD_ONE)) / DIVISION_CONST
  end

  def check_validate
    return if is_number_integer(@number1) && is_number_integer(@number2)

    raise IntegerError, "input numbers must be integers"
  end

  def is_number_integer(number)
    number.to_i.to_s == number
  end
end

puts "Enter first integer"
number1 = gets.chomp
puts "Enter second integer"
number2 = gets.chomp

puts CalculateSumOfDigits.new(number1, number2).call


