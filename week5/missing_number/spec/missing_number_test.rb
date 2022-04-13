# testing missing number task

require '../missing_number'
require 'rspec/autorun'
require 'faker'

SMALL_TESTS_NUMBER = 10
TESTS_NUMBER = 100
PERMUTATION_RANGE = (1..10).to_a.permutation.to_a[1..1000]
NUMBER_RANGE = 0...1000
NINE = 9
ERROR_MESSAGE = "every number in array must be integer between 1 and 10"

describe NumbersArray do
  TESTS_NUMBER.times do 
    faker = Faker::Number.within(range: NUMBER_RANGE)
    faker_chars = Faker::Alphanumeric.alpha(number: NINE).split

    numbers = PERMUTATION_RANGE[faker].clone
    faker_size = numbers.clone
    last_number = numbers.pop

    it "check array is correct" do 
      expect(NumbersArray.new(numbers).call).to equal last_number
    end

    it "check array is contain symbols correct" do 
      expect(NumbersArray.new(faker_chars).call).to eq ERROR_MESSAGE
    end
    
    it "check array size is not correct" do 
      expect(NumbersArray.new(faker_size).call).to eq ERROR_MESSAGE
    end
  end
end