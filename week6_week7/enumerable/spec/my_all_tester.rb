# check my_each method

require '../enumerable'
require 'rspec/autorun'
require 'faker'

describe Enumerable do
  let(:array_size) { rand(0..1000) }
  let(:array_element) { rand(-100_000..100_000) }
  let(:element_size) { (0..10) }

  context "myarray use my_all? method" do
    it "use my_all? method for integer array" do 
      input = Array.new(array_size) { array_element }
      first_bool = input.my_all? { |element| element.positive? }
      second_bool = input.all? { |element| element.positive? }
      expect(first_bool).to equal second_bool
    end

    it "use my_all? method in strings array" do
      input = Faker::Types.rb_array(len: array_size)
      first_bool = input.my_all? { |element| element.size >= 12 }
      second_bool = input.all? { |element| element.size >= 12 }
      expect(first_bool).to equal second_bool
    end

    it "use my_all? method in strings array" do
      input = Faker::Types.rb_array(len: array_size)
      first_bool = input.my_all? { |element| element.is_a? String }
      second_bool = input.all? { |element| element.is_a? String }
      expect(first_bool).to equal second_bool
    end

    it "use my_all? method in empty array" do
      input = []
      first_bool = input.my_all? { |element| element.is_a? String }
      second_bool = input.all? { |element| element.is_a? String }
      expect(first_bool).to equal second_bool
    end

    it "use my_all? method in string and number array " do
      string_array = Faker::Types.rb_array(len: array_size)
      number_array = Array.new(array_size) { array_element }
      input = string_array + number_array
      first_bool = input.my_all? { |element| element.is_a? Object }
      second_bool = input.all? { |element| element.is_a? Object }
      expect(first_bool).to equal second_bool
    end

    it "use my_all? method in string and number array " do
      string_array = Faker::Types.rb_array(len: array_size)
      number_array = Array.new(array_size) { array_element }
      input = string_array + number_array
      first_bool = input.my_all? { |element| element.is_a? String }
      second_bool = input.all? { |element| element.is_a? String }
      expect(first_bool).to equal second_bool
    end
  end
end


