# calculate ideal weight

IDEAL_WEIGHT = 110

class Human
  def initialize
    puts "Enter name"
    @name = gets.chomp
    puts "Enter height"
    @height = gets.chomp.to_f
  end

  def call 
    check_errors
    ideal_weight
  rescue => e
    warn e
  end

  private

  def ideal_weight
    weight = @height - IDEAL_WEIGHT
    unless weight.negative?
      "Hello #{@name}, your height is #{@height} and your optimal weight is #{weight}"
    else
      "Hello #{@name}, Your weight is already optimal"
    end
  end

  def check_errors
    unless @height.positive?
      raise ArgumentError.new("Height must be positive number")
    end
  end
end

human = Human.new
puts human.call



