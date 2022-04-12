require '../repdigits_number'
require 'rspec/autorun'
require 'faker'

ONE_NUMBER_RANGE = 1..9
PRODUCT_RANGE = 1..10000
TESTS_NUMBER = 100
SMALL_TESTS_NUMBER = 10
MIN_ALPHA = 10
MIN_NUMERIC = 10
NUMBER = 1000

describe RepdigitsNumber do 
  faker = Faker::Number.within(range: ONE_NUMBER_RANGE)
  product_faker = Faker::Number.within(range:PRODUCT_RANGE)
  string_faker = Faker::Alphanumeric.alphanumeric(number: NUMBER, min_alpha: MIN_ALPHA)

  TESTS_NUMBER.times do 
    it "check that number is repdigit number" do 
      expect(RepdigitsNumber.new(faker.to_s * product_faker).call).to equal true
    end
  end

  TESTS_NUMBER.times do
    number1 = (faker * product_faker).to_s
    number2 = (faker * product_faker).to_s
    number = ''
    if number1[-1] != number2[-1] 
      number = number1 + number2
    else
      number = number1 + number2 + '0'
    end
    it "check that number is not repdigits" do 
      expect(RepdigitsNumber.new(number).call).to equal false
    end
  end

  SMALL_TESTS_NUMBER.times do 
    it "raise error when number is not positive integer" do 
      expect(RepdigitsNumber.new(string_faker).call).eql? "input value must be positive number"
    end
  end

  SMALL_TESTS_NUMBER.times do
    it "raise error when number is empty string" do 
      negative_num = '-' + faker.to_s * product_faker
      expect(RepdigitsNumber.new(negative_num).call).eql? "input value must be positive number"
    end
  end

  it "raise error when number is empty string" do 
    expect(RepdigitsNumber.new('').call).eql? "input value must be positive number"
  end
end


