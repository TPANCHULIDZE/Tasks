# find months 

require 'date'

DAYS_IN_MONTH = 30
CONST = -1
STARTIN_POINT = 1
ENDING_POINT = 12

class Year
  def initialize(year)
    @year = year
    check_errors
    @year_hash = {}
  end

  def create_hash
    month_array = Date::MONTHNAMES
    (STARTIN_POINT..ENDING_POINT).each do |i|
      @year_hash[month_array[i].to_s] = Date.new(@year, i, CONST).day
    end
    @year_hash
  end

  def check_errors
    if !(@year.is_a? Integer) || @year.zero?
      raise ArgumentError.new('Year have to be integer')
    end
  end
end

year = gets.chomp.to_i

year_hash = Year.new(year).create_hash

year_hash.each { |key, value| puts key if value == DAYS_IN_MONTH }
 

