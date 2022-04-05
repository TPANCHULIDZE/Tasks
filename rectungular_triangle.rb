# check triangle is rectangular, isosceles and equilateral

class Triangle
  def initialize(side1, side2, side3)
    @side1, @side2, @side3 = [side1, side2, side3].sort
  end
  
  def call
    check_errors
    answer
  rescue => e
    warn e
  end

  private

  def answer
    case 
    when is_phitagorean? && is_isosceles?
      'The Triangle is Rectungular and isosceles'
    when is_equilateral? && is_triangle?
      'The Triangle is equilateral and isosceles'
    when is_phitagorean?
      'The Triangle is Rectungular'
    when is_isosceles? && is_triangle?
      'The Triangle isosceles'
    when is_triangle?
      'The is just Triangle'
    else
      'The is not a Triangle'
    end
  end

  def is_phitagorean?
    @side3**2 == @side1**2 + @side2**2
  end

  def is_isosceles?
    @side2 == @side1 || @side2 == @side3
  end

  def is_equilateral?
    @side2 == @side1 && @side2 == @side3
  end

  def is_triangle?
    @side1 + @side2 > @side3
  end

  def check_errors
    if is_sides_not_numeric? || is_sides_zero? 
      raise ArgumentError.new('Every side have to be Numeric')
    end
  end

  def is_sides_not_numeric?
    !((@side1.is_a? Numeric) && (@side2.is_a? Numeric) && (@side3.is_a? Numeric))
  end

  def is_sides_zero?
    @side1.zero? || @side2.zero? || @side3.zero?
  end
end

side1 = gets.chomp.to_f
side2 = gets.chomp.to_f
side3 = gets.chomp.to_f

triangle = Triangle.new(side1, side2, side3)
puts triangle.call


