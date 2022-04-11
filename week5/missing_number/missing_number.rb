# find missing number in array 
  
INTERVAL = 1..10

class NumbersArray
  class IntegerError < StandardError; end

  def initialize(numbers)
    @numbers = numbers
  end

  def call
    check_validate
    find_missing_number
  rescue IntegerError => e
    warn e
  end

  private

  def find_missing_number
    INTERVAL.each { |index| return index unless  @numbers.include? index}
  end

  def equal_number(index)
    (index + 1) == @numbers[index]
  end

  def check_validate
   unless @numbers.all? { |number| (1..10).to_a.include? number}
    raise IntegerError, "every number in array must be integer between 1 and 10"
   end
  end
end

puts NumbersArray.new([4,2,3,5,6,7,8,9,10]).call