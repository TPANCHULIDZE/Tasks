# check enumerable methods

require '../enumerable'
require 'rspec/autorun'
require 'faker'

describe Enumerable do
  let(:array_size) { rand(0..1000) }
  let(:array_element) { rand(-100_000..100_000) }
  let(:element_size) { (0..10) }

  context "myarray use mymap method" do
    it "use my_map in number array" do
      input = Array.new(array_size) { array_element }
      my_answer = input.my_map { |element| element * element  }
      answer = input.map { |element| element * element }
      expect(my_answer).to eq answer
    end

    it "use my_map in string array" do
      input = Faker::Types.rb_array(len: array_size)
      my_answer = input.my_map { |element| element if element.size >= 4 }
      answer = input.map { |element| element if element.size >= 4 }
      expect(my_answer).to eq answer
    end

    it "use my_map in empty array" do
      input = []
      my_answer = input.my_map { |element| element  }
      answer = input.map { |element| element }
      expect(my_answer).to eq answer
    end

    it "use my_map in string and number array" do
      string_array = Faker::Types.rb_array(len: array_size)
      number_array = Array.new(array_size) { array_element }
      input = string_array + number_array
      my_answer = input.my_map { |element| element.is_a? String }
      answer =  input.map { |element| element.is_a? String }
      expect(my_answer).to eq answer
    end

    it "use my_map in string and number array" do
      string_array = Faker::Types.rb_array(len: array_size)
      number_array = Array.new(array_size) { array_element }
      input = string_array + number_array
      my_answer = input.my_map { |element| element.is_a? Numeric }
      answer = input.map { |element| element.is_a? Numeric }
      expect(my_answer).to eq answer
    end

    it "use my_map with proc in number array" do
      input = Array.new(array_size) { array_element }
      new_proc = Proc.new { |element| element * 2 }
      my_answer = input.my_map(&new_proc)
      answer = input.map(&new_proc)
      expect(my_answer).to eq answer
    end

    it "use my_map with proc in string array" do
      input = Array.new(array_size) { array_element }
      new_proc = Proc.new { |element| element * 5 }
      my_answer = input.my_map(&new_proc)
      answer = input.map(&new_proc)
      expect(my_answer).to eq answer
    end

    it "use my_map with proc in empty array" do
      input = []
      new_proc = Proc.new { |element| element * 3 }
      my_answer = input.my_map(&new_proc)
      answer = input.map(&new_proc)
      expect(my_answer).to eq answer
    end

    it "use my_map with proc in number array" do
      input = Array.new(array_size) { array_element }
      new_proc = Proc.new { |element| element * 2 }
      my_answer = input.my_map(&new_proc)
      answer = input.map(&new_proc)
      expect(my_answer).to eq answer
    end

    it "use my_map with proc in number array" do
      input = Array.new(array_size) { array_element }
      new_proc = Proc.new { |element| element  + 100 }
      my_answer = input.my_map(&new_proc)
      answer = input.map(&new_proc)
      expect(my_answer).to eq answer
    end
  end
end


