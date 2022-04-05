# calculate triangle area

HALF = 0.5

class Triangle
  def initialize(base, height)
    @base, @height = base, height
  end

  def call
    check_errors
    calculate_area
  rescue => e
    warn e
  end

  private

  def calculate_area
    @base * @height * HALF
  end

  def check_errors
    if is_zero?
      raise ArgumentError.new("base and height must be positive number")
    end
  end

  def is_zero?
    @base.zero? || @height.zero?
  end
end

puts "Enter triangle base"
base = gets.chomp.to_f
puts "Enter triangle height"
height = gets.chomp.to_f

triangle = Triangle.new(base, height)

puts triangle.call


