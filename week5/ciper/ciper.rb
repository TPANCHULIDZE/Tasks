# converting string by caesar ciper
  
LOWER_ALPHABET = ('a'..'z').to_a
UPPER_ALPHABET = ('A'..'Z').to_a
ALPHABET_SIZE = 26

class CaesarCiper
  class IntegerError < StandardError; end

  def initialize(ciper_string, ciper_number)
    @ciper_string = ciper_string
    @ciper_number = ciper_number
  end

  def call 
    check_validate
    converting_string
  rescue IntegerError => e
    e.message
  end

  private

  def converting_string
    @answer = ""
    @ciper_string.each_char do |char|
      if LOWER_ALPHABET.include? char
        @answer += find_new_index(LOWER_ALPHABET, char)
      elsif UPPER_ALPHABET.include? char
        @answer += find_new_index(UPPER_ALPHABET, char)
      else
        @answer += char
      end
    end
    @answer
  end

  def find_new_index(alfabet, char)
    alfabet[(alfabet.index(char) + @ciper_number.to_i) % ALPHABET_SIZE]
  end

  def check_validate
    return if @ciper_number.to_i.to_s == @ciper_number

    raise IntegerError, "ciper number must be integer"
  end
end

# string = gets.chomp
# number = gets.chomp
# puts CaesarCiper.new(string, number).call


