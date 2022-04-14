# find out if number is a repdigits number

class RepdigitsNumber
  class IntegerError < StandardError; end

  def initialize(number)
    @number ||= number
  end

  def call
    check_validate
    is_repdigit?
  rescue IntegerError => e
    return e.message
  end

  private

  def is_repdigit?
    @number.split('').uniq.size == 1
  end

  def check_validate
    return if (@number.to_i.to_s == @number && @number.to_i.positive?)

    raise IntegerError, "input value must be positive number"
  end
end

# puts "please enter positive integer"
# number = gets.chomp
# puts RepdigitsNumber.new(number).call


