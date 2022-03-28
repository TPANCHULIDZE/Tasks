# frozen_string_literal: true

class Triangle
  def area(a, h)
    (a * h) / 2
  end
end

base = gets.chomp.to_f
height = gets.chomp.to_f

puts Triangle.new.area(base, height)
