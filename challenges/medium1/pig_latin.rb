class PigLatin
  VOWELS = %w(a e yt xr)
  CONSONANTS = %w(p k ch qu squ thr th f r y x sch)
  
  def self.translate(str)
    str.split.map { |word| piggify(word) }.join(' ')
  end
  
  def self.piggify(word)
    VOWELS.each do |vowel|
      if word.start_with?(vowel)
        return word + "ay"
      end
    end
    CONSONANTS.each do |consonant|
      if word.start_with?(consonant)
        return word.gsub(consonant, '') + consonant + "ay"
      end
    end
  end
end