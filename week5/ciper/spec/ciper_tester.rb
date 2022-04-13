#check caesar ciper code

require '../ciper'
require 'rspec/autorun'
require 'faker'

SMALL_TESTS_NUMBER = 10
TESTS_NUMBER = 100
PERMUTATION_RANGE = (1..26).to_a
NUMBER_RANGE = 0...1000
ERROR_MESSAGE = "ciper number must be integer"
NEGATIVE_FROM = -1000
NEGATIVE_TO = -1
TWO = 2

describe CaesarCiper do
  TESTS_NUMBER.times do 
    faker = Faker::Number.within(range: NUMBER_RANGE)
    faker_string = Faker::Alphanumeric.alphanumeric(number: faker, min_numeric: TWO)
    faker_number = Faker::Number.within(range: NUMBER_RANGE)

    it "input string and number is correct" do
      encrypted = CaesarCiper.new(faker_string,faker_number.to_s).call 
      expect(faker_string).to eq CaesarCiper.new(encrypted, faker_number).unencrypted_text
    end
  end

  SMALL_TESTS_NUMBER.times do
    faker = Faker::Number.within(range: NUMBER_RANGE)
    faker_number = Faker::Number.negative(from: NEGATIVE_FROM, to: NEGATIVE_TO)
    faker_string = Faker::Alphanumeric.alpha(number: faker)
    faker_float = Faker::Number.decimal_part(digits: TWO)

    it "negative number is not allowed" do 
      expect(CaesarCiper.new(faker_string, faker_number.to_s).call).to eq ERROR_MESSAGE
    end

    it "float number is not allowed" do 
      expect(CaesarCiper.new(faker_string, faker_float).call).to eq ERROR_MESSAGE
    end

    it "symbols as a number is not allowed" do 
      expect(CaesarCiper.new(faker_string, faker_string).call).to eq ERROR_MESSAGE
    end
  end
end

