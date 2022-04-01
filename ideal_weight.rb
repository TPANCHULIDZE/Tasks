# calculate ideal weight

IDEAL_WEIGHT = 110

class Human
  def initialize(name, height)
    @name = name
    @height = height
    
  end

  def ideal_weight
    check_errors
    weight = height - IDEAL_WEIGHT
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



name = gets.chomp
height = gets.chomp.to_f

human = Human.new(name, height)

puts human.ideal_weight
