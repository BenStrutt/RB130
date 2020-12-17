class TextAnalyzer
  def process
    yield(File.open('text_analyzer.txt').read)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split(/\n\n+/).count} paragraphs" }
analyzer.process { |text| puts "#{text.split(/\n/).count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }