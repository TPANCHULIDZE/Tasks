# check my_each method

require '../enumerable'
require 'rspec/autorun'
require 'faker'

describe Enumerable do
  let(:array_size) { rand(0..1000) }
  let(:array_element) { rand(-100_000..100_000) }
  let(:element_size) { (0..10) }

  context "myarray use my_count method" do
    it "use my_count method for integer array" do 
      input = Array.new(array_size) { array_element }
      my_answer = input.my_count { |element| element.positive? }
      answer = input.count { |element| element.positive? }
      expect(my_answer).to eq answer
    end

    it "use my_count method in strings array" do
      input = Faker::Types.rb_array(len: array_size)
      my_answer = input.my_count { |element| element.size >= 12 }
      answer = input.count { |element| element.size >= 12 }
      expect(my_answer).to eq answer
    end

    it "use my_count method in strings array" do
      input = Faker::Types.rb_array(len: array_size)
      my_answer = input.my_count { |element| element.is_a? String }
      answer = input.count { |element| element.is_a? String }
      expect(my_answer).to eq answer
    end

    it "use my_count method in empty array" do
      input = []
      my_answer = input.my_count { |element| element.is_a? String }
      answer = input.count { |element| element.is_a? String }
      expect(my_answer).to eq answer
    end

    it "use my_count method in string and number array " do
      string_array = Faker::Types.rb_array(len: array_size)
      number_array = Array.new(array_size) { array_element }
      input = string_array + number_array
      answer = input.my_count { |element| element.is_a? Object }
      my_answer = input.count { |element| element.is_a? Object }
      expect(my_answer).to eq answer
    end

    it "use my_count method in string and number array " do
      string_array = Faker::Types.rb_array(len: array_size)
      number_array = Array.new(array_size) { array_element }
      input = string_array + number_array
      my_answer = input.my_count { |element| element.is_a? String }
      answer = input.count { |element| element.is_a? String }
      expect(my_answer).to eq answer
    end
  end
end


