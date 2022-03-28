# frozen_string_literal: true

# letters

class Letters
  CONT = 96
  def create_vowel
    @vowel = {}
    "aeiou".each_char do |i|
      @vowel[i] = i.ord - CONT
    end
    @vowel
  end
end


p Letters.new.create_vowel