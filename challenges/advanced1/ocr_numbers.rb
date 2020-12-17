require 'pry'

class OCR
  NUMBERS = {
    '1' => ['', '  |', '  |'],
    '2' => [' _', ' _|', '|_'],
    '3' => [' _', ' _|', ' _|'],
    '4' => ['', '|_|', '  |'],
    '5' => [' _', '|_', ' _|'],
    '6' => [' _', '|_', '|_|'],
    '7' => [' _', '  |', '  |'],
    '8' => [' _', '|_|', '|_|'],
    '9' => [' _', '|_|', ' _|'],
    '0' => [' _', '| |', '|_|']
  }.freeze

  def initialize(text)
    @text = text
  end

  def convert
    @text.split("\n\n").map { |row| read_numbers(row) }.join(',')
  end

  private

  def read_numbers(text)
    rows = text.split("\n")
    size = rows.map(&:size).max
    row_cols = rows.map { |l| l.ljust(size).chars.each_slice(3).map(&:join) }
    row_cols.transpose.map do |n| 
      number = NUMBERS.select { |_, v| v == n.map(&:rstrip) }.keys.first
      !!number ? number : '?'
    end.join
  end
end