# check triangle is rectangular, isosceles and equilateral

class Triangle
  def right(side1, side2, side3)
    @side1, @side2, @side3 = [side1, side2, side3].sort
    check_errors
    answer
  end

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
    unless (@side1.is_a? Float) && (@side2.is_a? Float) && (@side3.is_a? Float)
      raise ArgumentError.new('Every side have to be Float')
    end
  end
end

side1 = gets.chomp.to_f
side2 = gets.chomp.to_f
side3 = gets.chomp.to_f

puts Triangle.new.right(side1, side2, side3)
