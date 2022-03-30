# create increment array

class Numbers
  STARTING_POINT = 10
  ENDING_POINT = 100
  STEP = 5
  def create_array
    array = []
    (STARTING_POINT..ENDING_POINT).step(STEP) do |i|
      array << i
    end
    array
  end
end

p Numbers.new.create_array
