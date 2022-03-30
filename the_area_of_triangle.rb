# calculate triangle area

HALF = 0.5

class Triangle
  def initialize(base, height)
    @base, @height = base, height
  end

  def calculate_area(base, height)
    check_errors
    base * height * HALF
  end

  def check_errors
    unless (@base.is_a? Float) && (@height.is_a? Float)
      raise ArgumentError.new('base and height have to be Float')
    end
  end
end

base = gets.chomp.to_f
height = gets.chomp.to_f

triangle = Triangle.new(base, height)

puts triangle.calculate_area
