# create increment array

class Numbers
  def create_array
    array = []
    (10..100).step(5) do |i|
      array << i
    end
    array
  end
end

p Numbers.new.create_array
