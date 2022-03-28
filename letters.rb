# frozen_string_literal: true

# letters

class Letters
  def create_vowel(string)
    @vowel = { 'a' => 0, 'e' => 0, 'i' => 0, 'o' => 0, 'u' => 0 }
    string = string.downcase.gsub(/[^aeiuo]/, '')
    string.each_char do |i|
      @vowel[i] += 1
    end
    @vowel
  end
end


