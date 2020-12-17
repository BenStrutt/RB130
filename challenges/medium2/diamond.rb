class Diamond
  def self.make_diamond(middle)
    result = [*'A'..middle]
    result.map!.with_index do |c, i|
      out_pad = " " * (result.size - i - 1)
      in_pad = " " * (1 + ((i - 1) * 2)) if i > 0
      i.zero? ? out_pad + c + out_pad : out_pad + c + in_pad + c + out_pad
    end
    (result + result[0..-2].reverse).join("\n") + "\n"
  end
end

puts Diamond.make_diamond('Z')