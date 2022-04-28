# check my_each method

require '../enumerable'
require 'rspec/autorun'
require 'faker'

describe Enumerable do
  let(:array_size) { rand(0..1000) }
  let(:array_element) { rand(-100_000..100_000) }
  let(:element_size) { (0..10) }

  context "myarray use my_each method" do
    it "use my_each method for integer array" do 
      input = Array.new(array_size) { array_element }
      my_answer = []
      answer = []
      input.my_each{ |element| my_answer << element }
      input.each{ |element| answer << element }
      expect(my_answer).to eq answer
    end

    it "use my_each method in strings array" do
      input = Faker::Types.rb_array(len: array_size)
      my_answer = []
      answer = []
      input.my_each{ |element| my_answer << element }
      input.each{ |element| answer << element }
      expect(my_answer).to eq answer
    end

    it "use my_each method in empty array" do
      input = []
      my_answer = []
      answer = []
      input.my_each{ |element| my_answer << element }
      input.each{ |element| answer << element }
      expect(my_answer).to eq answer
    end

    it "use my_each method in string and number array " do
      string_array = Faker::Types.rb_array(len: array_size)
      number_array = Array.new(array_size) { array_element }
      input = string_array + number_array
      my_answer = []
      answer = []
      input.my_each{ |element| my_answer << element }
      input.each{ |element| answer << element }
      expect(my_answer).to eq answer
    end
  end
end


