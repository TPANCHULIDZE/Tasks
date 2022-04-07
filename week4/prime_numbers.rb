# calculate prime numbers in 1..number range

class PrimeNumbersCounter
  include Math

  def initialize(numbers)
    @numbers ||= numbers
  end

  def call
    count_prime_numbers
  end

  private

  def count_prime_numbers
    @numbers.count { |number| is_prime?(number) }
  end

  def is_prime?(number)
    return false if number == 1

    sqrt_number = Math.sqrt(number)
    (2..sqrt_number).each do |divisor|
      return false if number % divisor == 0
    end
    true
  end
end


class Numbers
  class IntegerError < StandardError; end

  def initialize
    @numbers ||= []
  end

  def call
    fill_array
    @numbers
  end

  private

  def fill_array
    loop do
      puts "please enter integer, if you want end input enter stop"
      number = gets.chomp
      break if number == "stop"
      check_validate(number)
      @numbers << number.to_i
    rescue IntegerError => e
      puts e
    end
  end

  def check_validate(number)
    unless is_number_positive_integer?(number)
      raise IntegerError, "Input value have to be integer"
    end
  end

  def is_number_positive_integer?(number)
    number.to_i.to_s == number && number.to_i > 0
  end
end

numbers = Numbers.new.call

p PrimeNumbersCounter.new(numbers).call


