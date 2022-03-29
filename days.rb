# calculate days 

require 'date'

class Days
  def initialize(year, month, day)
    @year, @month, @day = year, month, day
  end

  def calculate
    Date.new(@year, @month, @day).yday
  end

  def check_errors
    unless (@year.is_a? Integer) && (@month.is_a? Integer) && (@day.is_a? Integer)
      raise ArgumentError.new('year, month and day have to Integer')
    end
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