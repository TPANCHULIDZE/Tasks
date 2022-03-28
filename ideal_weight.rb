class Human
	def ideal_weight(name, height)
		if height - 110 >= 0
			return "Hello #{name}, your height is #{height} and your optimal weight is #{height - 110}"
		else
			return "Hello #{name}, Your weight is already optimal"
		end
	end


end

human = Human.new

name = gets.chomp
height = gets.chomp

puts human.ideal_weight(name, height)