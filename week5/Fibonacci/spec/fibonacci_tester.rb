require_relative 'rspec_helper'
require 'Fibonacci/fibonacci_number.rb'

describe FibonacciNumber do
  it "check if 3 elements sum is 2" do
    expect(FibonacciNumber.new(5).call).to eq(2)
  end
end