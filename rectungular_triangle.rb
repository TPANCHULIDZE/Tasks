# frozen_string_literal: true

class Triangle
  def right(side1, side2, side3)
    @side1, @side2, @side3 = [side1, side2, side3].sort

    if phitagorean?
      if isosceles?
        'The Triangle is Rectungular and isosceles'
      else
        'The Triangle is Rectungular'
      end
    elsif equilateral?
      'The Triangle is equilateral and isosceles'
    elsif isosceles?
      'The Triangle is isosceles'
    end
  end

  def phitagorean?
    @side3**2 == @side1**2 + @side2**2
  end

  def isosceles?
    @side2 == @side1 || @side2 == @side3
  end

  def equilateral?
    @side2 == @side1 && @side2 == @side3
  end
end

side1 = gets.chomp.to_f
side2 = gets.chomp.to_f
side3 = gets.chomp.to_f

puts Triangle.new.right(side1, side2, side3)
