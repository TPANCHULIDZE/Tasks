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
    converting_string(:+)
  rescue IntegerError => e
    e.message
  end

  def unencrypted_text
    unencrypted_answer = converting_string(:-)
  end

  private

  def converting_string(operator)
    @ciper_string.split("").reduce("") do |answer, char|
      if LOWER_ALPHABET.include? char
        answer += find_new_index(LOWER_ALPHABET, char, operator)
      elsif UPPER_ALPHABET.include? char
        answer += find_new_index(UPPER_ALPHABET, char, operator)
      else
        answer += char
      end
    end
  end

  def find_new_index(alfabet, char, operator)
    alfabet[(alfabet.index(char).send(operator, @ciper_number.to_i)) % ALPHABET_SIZE]
  end

  def check_validate
    return if @ciper_number.to_i.to_s == @ciper_number && !@ciper_number.to_i.negative?

    raise IntegerError, "ciper number must be integer"
  end
end

# string = gets.chomp
# number = gets.chomp
 # puts CaesarCiper.new('sdd', '3').call


