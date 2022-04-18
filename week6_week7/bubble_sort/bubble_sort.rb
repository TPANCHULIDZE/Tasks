# bubble sort algorithm

ERROR_MESSAGE = "input array have to contain same class elements"

class Bubble
  def initialize(bubble)
    @bubble = bubble
  end

  def call 
    check_validate
    bubble_sort
  rescue ArgumentError => e
    ERROR_MESSAGE
  end

  private 

  def bubble_sort
    swap_counter = 1
    s = 0
    bubble_size = @bubble.size
    until swap_counter.zero?
      swap_counter = 0
      (1...bubble_size).each do |index|
        if @bubble[index - 1] > @bubble[index]
          @bubble[index - 1], @bubble[index] = @bubble[index], @bubble[index - 1]
          swap_counter += 1  
        end
      end
    end
    @bubble
  end

  def check_validate
    return if @bubble.all? { |element| element.class == @bubble.first.class }

    raise ArgumentError, ERROR_MESSAGE
  end
end


