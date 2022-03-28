class Triangle
	def right(side1, side2, side3)
		@side1, @side2, @side3 = [side1, side2, side3].sort

		if phitagorean?
			if isosceles?
				return "The Triangle is Rectungular and isosceles"
			else
				return "The Triangle is Rectungular"
			end
		else
			if equilateral?
				return "The Triangle is equilateral and isosceles"
			elsif isosceles?
				return "The Triangle is isosceles"
			end
		end
		
	end

	def phitagorean?
		@side3 ** 2 == @side1 ** 2 + @side2 ** 2
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