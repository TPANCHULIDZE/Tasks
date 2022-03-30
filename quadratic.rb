# quadratic equation, calculate roots and discriminant

class Quadratic
  DISC_CONST = 4
  HALF = 2
  def equation(first, second, third)
    @first, @second, @third = first, second, third
    check_errors
    answer
  end

  def answer
    disc = find_disc
    case 
    when disc.negative?
      "Discriminant is #{disc}, No Roots"
    when disc.positive?
      root1 = find_root(disc, '+')
      root2 = find_root(disc, '-')
      "Discriminant is #{disc}, and Roots are #{root1} and #{root2}"
    when disc.zero?
      root = find_root(disc, '+')
      "Discriminant is #{disc} and Root is #{root}"
    end
  end

  def find_disc
    @second**2 - DISC_CONST * @first * @third
  end

  def find_root(disc, operation)
    -@second.send(operation, Math.sqrt(disc)) / (HALF * @first)
  end

  def check_errors
    if is_coefficient_not_numeric? || is_coefficient_zero?
      raise ArgumentError.new('Every side have to be Numeric')
    end
  end

  def is_coefficient_not_numeric?
    !((@first.is_a? Numeric) && (@second.is_a? Numeric) && (@third.is_a? Numeric))
  end

  def is_coefficient_zero?
    @first.zero? || @second.zero? || @third.zero?
  end
end



first = gets.chomp.to_f
second = gets.chomp.to_f
third = gets.chomp.to_f

quadratic = Quadratic.new
puts quadratic.equation(first, second, third)
