# Fibonacci numbers

class Fibonacci
  def create_fibonacci(number)
    fibo = []
    fibo[0] = 0
    fibo[1] = 1
    (2..number).each do |i|
      fibo << fibo[i - 1] + fibo[i - 2]
    end
    fibo
  end
end

p Fibonacci.new.create_fibonacci(100)
