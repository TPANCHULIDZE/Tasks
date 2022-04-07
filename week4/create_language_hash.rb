# Count the number of characters in each array element

PROGRAMING_LANGUAGE_ARRAY = ['Ruby', 'Python', 'Java', '.NET', 'HTML', 'JavaScript']

class ProgramingLanguage
  def initialize(language_array)
    @language_array = language_array
  end

  def call
    find_character_number
  end

  private

  def find_character_number
    @language_array.inject({}) do |language_hash, element| 
      language_hash[element] = element.size
      language_hash
    end
  end
end

programing_language = ProgramingLanguage.new(PROGRAMING_LANGUAGE_ARRAY)
p programing_language.call


