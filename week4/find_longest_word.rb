# find longest word in array 

LANGUAGE_ARRAY = ['Ruby', 'Python', 'Java', '.NET', 'HTML', 'JavaScript']

class ProgramingLanguage
  def initialize(language_array)
    @language_array = language_array
  end

  def call
    find_longest_word
  end

  private 

  def find_longest_word
    @language_array.max_by(&:length)
  end
end

programing_laguage = ProgramingLanguage.new(LANGUAGE_ARRAY)
puts programing_laguage.call


