def rot13(txt)
  txt.split('').map { |c| c =~ /[a-zA-Z]/ ? rotate(c) : c }.join
end

def rotate(c)
  letters = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  is_upper = (c == c.upcase)
  c = letters[((c.ord > 64 && c.ord < 91) ? c.ord - 65 : c.ord - 97) - 13]
  is_upper ? c.upcase : c
end

File.open("encrypted.txt").each { |name| puts rot13(name) }