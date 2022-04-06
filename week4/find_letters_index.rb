# find letters index in string 

class LettersIndex
  class LettersError < StandardError; end

  def initialize(letters)
    @letters = letters
    @letters_hash = {}
  end

  def call
    check_validate
    find_letters_index
  rescue LettersError => e
    warn e
  end

  private

  def find_letters_index
    @letters.each_char.with_index do |letter, index|
      @letters_hash[letter] ||= [] 
      @letters_hash[letter] << index
    end
    @letters_hash
  end

  def check_validate
    unless @letters.scan(/[^a-z]/).empty?
      raise LettersError, "input string only contain letters"
    end
  end
end

puts "please enter string"
letters = gets.chomp

puts LettersIndex.new(letters).call


