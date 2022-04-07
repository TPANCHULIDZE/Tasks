# count numbers of items which greater than 5

class CountItemsNumber
  def initialize(numbers)
    @numbers ||= numbers
  end

  def call
    count_number
  end

  private

  def count_number
    @numbers.count { |number| number > 5 }
  end
end

class Numbers
  class NumberError < StandardError; end

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
      @numbers << number.to_f
    rescue NumberError => e
      puts e
    end
  end

  def check_validate(number)
    unless number_is_numeric(number)
      raise NumberError, "Input value have to be integer"
    end
  end

  def number_is_numeric(number)
    number.to_i.to_s == number || number.to_f.to_s == number
  end
end

numbers = Numbers.new.call

p CountItemsNumber.new(numbers).call


