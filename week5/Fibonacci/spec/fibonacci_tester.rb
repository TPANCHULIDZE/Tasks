# fibonacci even numbers sum

require '../fibonacci_number'
require 'rspec/autorun'
require 'faker'
  
FIBONACCI_RANGE = 1..100
TESTS_NUMBER = 100
SMALL_TESTS_NUMBER = 10
ERROR_MESSAGE = "input value must be positive number but less than 100"
MIN_ALPHA = 10
MIN_NUMERIC = 10
NUMBER = 1000
ONE_HUNDRED = 100

describe FibonacciNumber do
  TESTS_NUMBER.times do 
    faker = Faker::Number.within(range: FIBONACCI_RANGE)
    it "check if fibonacci elements sum is correct" do
      expect(FibonacciNumber.new(faker.to_s).call).to eq fibonacci_number_sum(faker)
    end
  end

  SMALL_TESTS_NUMBER.times do 
    negative_faker = Faker::Number.negative
    string_faker = Faker::Alphanumeric.alphanumeric(number: NUMBER, min_alpha: MIN_ALPHA)
    faker = Faker::Number.within(range: FIBONACCI_RANGE)

    it "negative number error" do
      expect(FibonacciNumber.new(negative_faker.to_s).call).to eq ERROR_MESSAGE 
    end

    it "alfabet input error" do 
      expect(FibonacciNumber.new(string_faker).call).to eq ERROR_MESSAGE
    end

    it "number is greaten than 100" do 
      expect(FibonacciNumber.new((ONE_HUNDRED + faker).to_s).call).to eq ERROR_MESSAGE
    end
  end

# this method take from stackoverflow to test my code
  def fibonacci_number_sum(limit)
    limit -= 3
    first_element = 1
    second_element = 1
    next_number = first_element + second_element
    sum = 0
    limit.times do 
      sum += next_number if next_number.even?
      first_element = second_element
      second_element = next_number
      next_number = first_element + second_element
    end
    sum
  end
end


