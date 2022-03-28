class Triangle
	def area(a, h)
		return (a * h) / 2
	end
end

base = gets.chomp.to_f
height = gets.chomp.to_f

puts Triangle.new.area(base, height)