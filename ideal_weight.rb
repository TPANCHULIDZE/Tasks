# frozen_string_literal: true

class Human
  def ideal_weight(name, height)
    if height - 110 >= 0
      "Hello #{name}, your height is #{height} and your optimal weight is #{height - 110}"
    else
      "Hello #{name}, Your weight is already optimal"
    end
  end
end

human = Human.new

name = gets.chomp
height = gets.chomp.to_f

puts human.ideal_weight(name, height)
