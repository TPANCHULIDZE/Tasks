# calculate triangle area

class Triangle
  CONST = 0.5
  def area(base, height)
    @base, @height = base, height
    check_errors
    base * height * CONST
  end

  def check_errors
    unless (@base.is_a? Float) && (@height.is_a? Float)
      raise ArgumentError.new('base and height have to be Float')
    end
  end
end

base = gets.chomp.to_f
height = gets.chomp.to_f

puts Triangle.new.area(base, height)
