# calculate ideal weight

class Human
  CONST = 110
  def ideal_weight(name, height)
    @name, @height = name, height
    weight = height - CONST
    check_errors
    unless weight.negative?
      "Hello #{name}, your height is #{height} and your optimal weight is #{weight}"
    else
      "Hello #{name}, Your weight is already optimal"
    end
  end

  def check_errors
    unless @height.is_a? Float
      raise ArgumentError.new('height have to be Float')
    end
  end
end

human = Human.new

name = gets.chomp
height = gets.chomp.to_f

puts human.ideal_weight(name, height)
