# calculate days 

require 'date'

class Days
  def initialize(year, month, day)
    @year, @month, @day = year, month, day
    check_errors
  end

  def calculate
    Date.new(@year, @month, @day).yday
  end

  def check_errors
    if is_not_numeric? || is_zero? 
      raise ArgumentError.new('year, month and day have to Integer')
    end
  end

  def is_not_numeric?
    !((@year.is_a? Integer) && (@month.is_a? Integer) && (@day.is_a? Integer))
  end

  def is_zero?
    @year.zero? || @month.zero? || @day.zero?
  end
end
  
puts "Enter year"
year = gets.chomp.to_i
puts "Enter month"
month = gets.chomp.to_i
puts "Enter day"
day = gets.chomp.to_i

day = Days.new(year, month, day)
puts day.calculate
