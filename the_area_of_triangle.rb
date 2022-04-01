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
    if is_zero?
      warn "base and height must be positive number"
      exit 1
    end
  end

  def is_zero?
    @base.zero? || @height.zero?
  end
end

base = gets.chomp.to_f
height = gets.chomp.to_f

triangle = Triangle.new(base, height)

puts triangle.calculate_area


