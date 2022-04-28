# check enumerable methods

require '../enumerable'
require 'rspec/autorun'
require 'faker'

describe Enumerable do
  let(:array_size) { rand(0..1000) }
  let(:array_element) { rand(-100_000..100_000) }
  let(:element_size) { (0..10) }

  context "myarray use myselect method" do
    it "use my_select in number array" do
      input = Array.new(array_size) { array_element }
      my_answer = input.my_select{ |element| element * element > 101_121 }
      answer = input.select{ |element| element * element > 101_121 }
      expect(my_answer).to eq answer
    end

    it "use my_select in string array" do
      input = Faker::Types.rb_array(len: array_size)
      my_answer = input.my_select { |element| element.size >= 4 }
      answer = input.select { |element| element.size >= 4 }
      expect(my_answer).to eq answer
    end

    it "use my_select in empty array" do
      input = []
      my_answer = input.my_select { |element| element <= 1 }
      answer = input.select { |element| element <= 1 }
      expect(my_answer).to eq answer
    end

    it "use my_select in string and number array" do
      string_array = Faker::Types.rb_array(len: array_size)
      number_array = Array.new(array_size) { array_element }
      input = string_array + number_array
      my_answer = input.my_select { |element| element.is_a? String }
      answer = input.select { |element| element.is_a? String }
      expect(my_answer).to eq answer
    end

    it "use my_select in string and number array" do
      string_array = Faker::Types.rb_array(len: array_size)
      number_array = Array.new(array_size) { array_element }
      input = string_array + number_array
      my_answer = input.my_select { |element| element.is_a? Numeric }
      answer = input.select { |element| element.is_a? Numeric }
      expect(my_answer).to eq answer
    end
  end
end


