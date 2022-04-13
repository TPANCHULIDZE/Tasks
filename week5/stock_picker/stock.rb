# find best index in input stock

class Stock
  class StringError < StandardError; end

  def initialize(stock)
    @stock = stock
  end

  def call 
    check_validate
    find_best_index
  rescue StringError => e
    e.message
  end

  private

  def find_best_index
    left_index = 0
    min_index = 0
    right_index = 0
    difference = 0
    @stock.each.with_index do |item, index|
      if item - @stock[min_index] > difference
        right_index = index 
        left_index = min_index
        difference = item - @stock[min_index]
      end
      
      if item < @stock[min_index]
        min_index = index 
      end
    end
    [left_index, right_index]
  end

  def check_validate
    return if @stock.all? { |item| (item.is_a? Numeric) && !item.negative? }

    raise StringError, "input valus must be positive number"
  end

end