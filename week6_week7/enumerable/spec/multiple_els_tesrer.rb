# check enumerable methods

require '../enumerable'
require 'rspec/autorun'
require 'faker'

describe Enumerable do
  let(:array_size) { rand(0..10) }
  let(:array_element) { rand(-100..100) }
  let(:element_size) { (0..10) }

  context "myarray use multiple_els method" do
    it "use multiple_els in number array" do
      input = Array.new(array_size) { array_element }
      my_answer = input.multiple_els
      answer = input.multiple_els
      expect(my_answer).to eq answer
    end

    it "use multiple_els in number array" do
      input = Array.new(array_size) { array_element }
      my_answer = input.multiple_els
      answer = input.multiple_els
      expect(my_answer).to eq answer
    end

    it "use multiple_els in number array" do
      input = Array.new(array_size) { array_element }
      my_answer = input.multiple_els
      answer = input.multiple_els
      expect(my_answer).to eq answer
    end

    it "use multiple_els in number array" do
      input = Array.new(array_size) { array_element }
      my_answer = input.multiple_els
      answer = input.multiple_els
      expect(my_answer).to eq answer
    end

    it "use multiple_els in empty array" do
      input = []
      my_answer = input.multiple_els
      answer = input.multiple_els
      expect(my_answer).to eq answer
    end
  end
end


