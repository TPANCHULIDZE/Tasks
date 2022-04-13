# find missing number in array 
  
INTERVAL = 1..10
SIZE = 10

class NumbersArray
  class IntegerError < StandardError; end

  def initialize(numbers)
    @numbers = numbers.sort
  end

  def call
    check_validate
    find_missing_number
  rescue IntegerError => e
    e.message
  end

  private

  def find_missing_number
    INTERVAL.each { |index| return index + 1 unless  equal_number(index)}
  end

  def equal_number(index)
    (index + 1) == @numbers[index]
  end

  def check_validate
   unless @numbers.all? { |number| (INTERVAL).to_a.include? number} && @numbers.size < SIZE
    raise IntegerError, "every number in array must be integer between 1 and 10"
   end
  end
end

# puts NumbersArray.new([4,2,3,5,6,7,8,9,10]).call