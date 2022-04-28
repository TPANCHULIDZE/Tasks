# create my_each_with_index method

require '../enumerable'
require 'rspec/autorun'
require 'faker'

describe Enumerable do
  let(:array_size) { rand(0..1000) }
  let(:array_element) { rand(-100_000..100_000) }
  let(:element_size) { (0..10) }

  context "myarray use my_each_with_index" do
    it "use my_each_with_index method in integer array" do
      input = Array.new(array_size) { array_element }
      my_answer = []
      answer = []
      input.my_each_with_index{ |element, index| my_answer << [element, index] }
      input.each_with_index{ |element, index| answer << [element, index] }
      expect(my_answer).to eq answer
    end

    it "use my_each_with_index method in string array" do
      input = Faker::Types.rb_array(len: array_size)
      my_answer = []
      answer = []
      input.my_each_with_index{ |element, index| my_answer << [element, index] }
      input.each_with_index{ |element, index| answer << [element, index] }
      expect(my_answer).to eq answer
    end

    it "use my_each_with_index method in empty array" do
      input = []
      my_answer = []
      answer = []
      input.my_each_with_index{ |element, index| my_answer << [element, index] }
      input.each_with_index{ |element, index| answer << [element, index] }
      expect(my_answer).to eq answer
    end

    it "use my_each_with_index method in string array" do
      string_array = Faker::Types.rb_array(len: array_size)
      number_array = Array.new(array_size) { array_element }
      input = string_array + number_array
      my_answer = []
      answer = []
      input.my_each_with_index{ |element, index| my_answer << [element, index] }
      input.each_with_index{ |element, index| answer << [element, index] }
      expect(my_answer).to eq answer
    end
  end
end