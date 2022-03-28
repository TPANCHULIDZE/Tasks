# frozen_string_literal: true

class Numbers
  def back_fibo
    array = []
    (10..100).step(5) do |i|
      array << i
    end
    array
  end
end

p Numbers.new.back_fibo
