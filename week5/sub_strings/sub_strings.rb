# create hash which contain informations about number of words which is part of input word

class Dictionary
  class StringError < StandardError; end

  def initialize(input_word,dictionary)
    @dictionary = dictionary.uniq
    @input_word = input_word
    @words ||= {}
  end

  def call
    check_validate
    create_hash
  rescue StringError => e
    e.message
  end

  private

  def create_hash
    @input_word.downcase!
    @dictionary.each do |word|
      if @input_word.include? word
        @words[word] ||= 0
        find_word_numbers(word)
      end
    end
    @words
  end

  def find_word_numbers(word)
    word_size = word.size
    input_word_size = @input_word.size
    (input_word_size - word_size + 1).times do |index|
      if word.eql? @input_word[index, word_size]
        @words[word] += 1
      end
    end
  end

  def check_validate
    return if @dictionary.all? { |word| word.is_a? String } && (@input_word.is_a? String)

    raise StringError, "every input value must be string"
  end
end

# dictionary = %w[below ll low wol ss]
# puts Dictionary.new('below',dictionary).call


