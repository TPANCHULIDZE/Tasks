# quadratic equation, calculate roots and discriminant

CONST = 4
TWO = 2

class Quadratic

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
    @second**2 - CONST * @first * @third
  end

  def find_root(disc, operation)
    -@second.send(operation, Math.sqrt(disc)) / (TWO * @first)
  end

  def check_errors
    if @first.zero? || @second.zero? || @third.zero?
      raise ArgumentError.new('Every coefficient have to be Float')
    end
  end
end



first = gets.chomp.to_f
second = gets.chomp.to_f
third = gets.chomp.to_f

quadratic = Quadratic.new
puts quadratic.equation(first, second, third)



