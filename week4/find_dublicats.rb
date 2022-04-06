# find dublicats in array

class FindDublicatesServise
  def initialize(dublicate_array)
    @dublicate_array ||= dublicate_array
  end

  def call
    find_dublicates
  end

  private

  def find_dublicates
    @dublicate_array.select { |number| @dublicate_array.count(number) > 1 }.uniq
  end
end

class Numbers
  class IntegerError < StandardError; end

  def initialize
    @numbers ||= []
  end

  def call
    fill_array
    @numbers
  end

  private

  def fill_array
    loop do
      puts "please enter integer, if you want end input enter stop"
      number = gets.chomp
      break if number == "stop"
      check_validate(number)
      @numbers << number.to_i
    rescue IntegerError => e
      puts e
    end
  end

  def check_validate(number)
    unless number.to_i.to_s == number
      raise IntegerError, "Input value have to be integer"
    end
  end
end

numbers = Numbers.new.call

p FindDublicatesServise.new(numbers).call


