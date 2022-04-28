# enumerable methods

STARTING_POINT = 0
NO_BLOCK = "block is lost"

module Enumerable
  # class BlockLeftError < StandardError; end

  def my_each
    if block_given?
      size = self.size
      size.times do |index|
        yield(self[index])
      end
      self
    else
      NO_BLOCK
    end
  end

  def my_each_with_index
    if block_given?
      size = self.size
      size.times do |index|
        yield([self[index], index])
      end
      self
    else
      NO_BLOCK
    end
  end

  def my_select
    answer = []
    if block_given?
      my_each { |element| answer << element if yield(element) }
      answer
    else
      NO_BLOCK
    end
  end

  def my_all?
    if block_given?
      my_each { |element| return false unless yield(element) }
      true
    else
      NO_BLOCK
    end
  end

  def my_any?
    if block_given?
      my_each { |element| return true if yield(element) }
      false
    else
      NO_BLOCK
    end
  end

  def my_none?
    if block_given?
      my_each { |element| return false if yield(element) }
      true
    else
      NO_BLOCK
    end
  end

  def my_count
    counter = 0
    if block_given?
      my_each { |element| counter += 1 if yield(element) }
      counter
    else
      NO_BLOCK
    end
  end

  def my_map
    answer = []
    if block_given?
      my_each { |element| answer << yield(element) }
      answer
    else
      NO_BLOCK
    end
  end

  def my_inject(start_value, &block)
    if block_given?
      value = start_value
      my_each { |element| value = block.call(value, element) }
      value
    else
      NO_BLOCK
    end
  end

  def multiple_els
    my_inject(1) { |product, element| product * element }
  end

end


