class Quadratic

	def equation(a, b, c)
		@a, @b, @c = a, b, c

		@disc = find_disc

		if @disc.negative?
			return "Discriminant is #{@disc}, No Roots"
		else
			root1 = find_root(@disc, "+")
			root2 = find_root(@disc, "-")
			if root1 == root2
				return "Discriminant is #{@disc} and Root is #{root1}"
			else
				return "Discriminant is #{@disc}, and Roots are #{root1} and #{root2}"
			end
		end

	end

	def find_disc
		@b ** 2 - 4 * @a * @c
	end

	def find_root(disc, operation)
		-@b.send(operation, Math.sqrt(disc)) / (2 * @a)
	end

end


quadratic = Quadratic.new

a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f
 
 quadratic.equation(a, b, c)