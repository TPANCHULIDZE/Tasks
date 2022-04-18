# check enumerable methods

require '../enumerable'
require 'rspec/autorun'
require 'faker'

describe Enumerable do
  let(:array_size) { rand(0..1000) }
  let(:array_element) { rand(-100_000..100_000) }
  let(:element_size) { (0..10) }

  context "myarray use myinject method" do
    it "use my_inject in number array" do
      input = Array.new(array_size) { array_element }
      my_answer = input.my_inject(100_000_000) { |sum, element| sum  - element }
      answer = input.inject(100_000_000) { |sum, element| sum  - element }
      expect(my_answer).to eq answer
    end

    it "use my_inject in string array" do
      input = Faker::Types.rb_array(len: array_size)
      my_answer = input.my_inject("") { |sum, element| sum + element.to_s }
      answer = input.inject("") { |sum, element| sum + element.to_s}
      expect(my_answer).to eq answer
    end

    it "use my_inject in empty array" do
      input = []
      my_answer = input.my_inject(0) { |sum, element| sum + element }
      answer = input.inject(0) { |sum, element| sum + element }
      expect(my_answer).to eq answer
    end

    it "use my_inject in string and number array" do
      string_array = Faker::Types.rb_array(len: array_size)
      number_array = Array.new(array_size) { array_element }
      input = string_array + number_array
      my_answer = input.my_inject(0) { |sum, element| sum + element.to_i }
      answer = input.inject(0) { |sum, element| sum + element.to_i }
      expect(my_answer).to eq answer
    end

    it "use my_inject in string and number array" do
      string_array = Faker::Types.rb_array(len: array_size)
      number_array = Array.new(array_size) { array_element }
      input = string_array + number_array
      my_answer = input.my_inject("") { |sum, element| sum + element.to_s }
      answer = input.inject("") { |sum, element| sum + element.to_s }
      expect(my_answer).to eq answer
    end
  end
end


