class House

  def self.recite
    self.new.recite
  end
  
  def recite
    (0...pieces.size).map.with_index do |_,i|
      verse = "This is "
      pieces[i..-1].each { |line| verse += "#{line[0]}\n#{line[1] || ''} " }
      verse[0..-3] + '.'
    end.reverse.join("\n\n") + "\n"
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end