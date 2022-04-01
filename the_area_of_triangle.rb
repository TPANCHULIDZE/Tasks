# calculate triangle area

HALF = 0.5

class Triangle
  def initialize(base, height)
    @base, @height = base, height
  end

  def calculate_area
    check_errors
    @base * @height * HALF
  end

  def check_errors
    unless (@base.is_a? Float) && (@height.is_a? Float) && is_not_zero?
      raise ArgumentError.new('base and height have to be Float')
    end
  end

  def is_not_zero?
    !(@base.zero? && @height.zero?)
  end
end

base = gets.chomp.to_f
height = gets.chomp.to_f

triangle = Triangle.new(base, height)

puts triangle.calculate_area


