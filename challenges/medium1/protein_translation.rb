class InvalidCodonError < StandardError; end

class Translation
  ACIDS = {
    "Methionine" => %w(AUG),
    "Phenylalanine" => %w(UUU UUC),
    "Leucine" => %w(UUA UUG),
    "Serine" => %w(UCU UCC UCA UCG),
    "Tyrosine" => %w(UAU UAC),
    "Cysteine" => %w(UGU UGC),
    "Tryptophan" => %w(UGG),
    "STOP" => %w(UAA UAG UGA)
  }
  
  def self.of_rna(rna)
    acids = []
    codon = []
    rna.chars.each do |c|
      codon << c
      if codon.size == 3
        codon = codon.join
        raise InvalidCodonError if Translation.of_codon(codon).nil?
        return acids if Translation.of_codon(codon) == "STOP"
        acids << Translation.of_codon(codon)
        codon = []
      end
    end
    acids
  end
  
  def self.of_codon(codon)
    ACIDS.each { |key, val| return key if val.include?(codon) }
    nil
  end
end