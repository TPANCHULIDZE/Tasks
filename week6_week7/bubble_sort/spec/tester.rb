# bubble sort tester 

require '../bubble_sort'
require 'rspec/autorun'
require 'faker'

ARRAY_SIZE = (0..1000).freeze
ARRAY_ELEMENT = (-100_000..100_000).freeze
TESTS_SIZE = 100
SMALL_TESTS_SIZE = 10
ELEMENT_SIZE = (0..10).freeze
BAD = [1, 's']

module ArrayCreator
  def create_number_array
    faker = Faker::Number.within(range: ARRAY_SIZE)
    number_array = []
    faker.times do
      number_array << Faker::Number.within(range: ARRAY_ELEMENT)
    end
    number_array
  end

  def create_string_array
    faker = Faker::Number.within(range: ARRAY_SIZE)
    string_array = []
    faker.times do
      string_array << Faker::String.random(length: ELEMENT_SIZE)
    end
    string_array
  end
end

describe Bubble do
  include ArrayCreator

  context "input array contain same class elements and answer exist" do
    TESTS_SIZE.times do 
      it "check number array answer is correct" do
        number_array = create_number_array
        expect(Bubble.new(number_array).call).to eq number_array.sort
      end

      it "check string array answer is correct" do
        string_array = create_string_array
        expect(Bubble.new(string_array).call).to eq string_array.sort
      end
    end
  end

  context "check errors" do
    SMALL_TESTS_SIZE.times do
      it "array sort is impossible" do
        bad_array = create_number_array + create_string_array
        if bad_array.empty?
          bad_array + BAD
        end
        expect(Bubble.new(bad_array).call).to eq ERROR_MESSAGE
      end
    end
  end
end


