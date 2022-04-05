# calculate days 

require 'date'

class Days
  def initialize(year, month, day)
    @year, @month, @day = year, month, day
  end

  def call
    check_errors
    calculate
  rescue => e
    warn e
  end

  private

  def calculate
    Date.new(@year, @month, @day).yday
  end

  def check_errors
    unless Date.valid_date?(@year, @month, @day)
      raise ArgumentError.new('year, month and day have to positive integer')
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
puts day.call
