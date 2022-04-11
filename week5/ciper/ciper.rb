# converting string by caesar ciper
  
LOWER_ALFABET = ('a'..'z').to_a
UPPER_ALFABET = ('A'..'Z').to_a

class CaesarCiper
  def initialize(ciper_string, ciper_number)
    @ciper_string = ciper_string
    @ciper_number = ciper_number
  end

  def call 
    converting_string
  end

  private

  def converting_string
    @answer = ""
    @ciper_string.each_char do |char|
      if LOWER_ALFABET.include? char
        @answer += find_new_index(LOWER_ALFABET, char)
      elsif UPPER_ALFABET.include? char
        @answer += find_new_index(UPPER_ALFABET, char)
      else
        @answer += char
      end
    end
    @answer
  end

  def find_new_index(alfabet, char)
    alfabet[(alfabet.index(char) + @ciper_number) % 26]
  end
end

#puts CaesarCiper.new("What a string!",3).call