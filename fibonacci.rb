# Fibonacci numbers

START_POINT = 2
END_POINT = 100

class Fibonacci
  def create_fibonacci
    fibo = []
    fibo[0] = 0
    fibo[1] = 1
    (START_POINT..END_POINT).each do |i|
      fibo << fibo[i - 1] + fibo[i - 2]
    end
    fibo
  end
end

p Fibonacci.new.create_fibonacci
