#check stock picker code 

require '../stock'
require 'rspec/autorun'

ERROR_MESSAGE = "input valus must be positive number"

describe Stock do 
  it "find appropriate index in input array " do 
    input = [17, 3, 6, 9, 15, 8, 6, 1,10]
    answer = [1, 4]
    expect(Stock.new(input).call).to eq answer
  end

  it "find appropriate index in input array " do 
    input = [1, 3, 6, 9, 2, 8, 6, 1,10]
    answer = [0, 8]
    expect(Stock.new(input).call).to eq answer
  end

  it "find appropriate index in input array " do 
    input = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
    answer = [0, 0]
    expect(Stock.new(input).call).to eq answer
  end

  it "find appropriate index in input array " do 
    input = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1].reverse
    answer = [0, 9]
    expect(Stock.new(input).call).to eq answer
  end

  it "find appropriate index in input array " do 
    input = [17, 3, 6, 9, 15, 8, 6, 1,10].reverse
    answer = [1, 8]
    expect(Stock.new(input).call).to eq answer
  end

  it "catch error when input array contain string" do 
    input = [10, 9, 8, 7, 6, 5, 4, 3, 2, '1']
    expect(Stock.new(input).call).to eq ERROR_MESSAGE
  end

  it "catch error when input array contain negative number" do 
    input = [10, 9, 8, 7, 6, 5, 4, -3, 2, 1]
    expect(Stock.new(input).call).to eq ERROR_MESSAGE
  end

  it "find index when input array contain float number" do 
    input = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1].reverse
    answer = [0, 9]
    expect(Stock.new(input).call).to eq answer 
  end
end


