class WordProblem
  OPS = { 'plus' => '+', 'minus' => '-', 'multiplied' => '*', 'divided' => '/' }
  
  attr_accessor :init, :nums, :ops
  
  def initialize(problem)
    problem = problem[0..-2].gsub('by ', '').split(' ')[2..-1]
    @init = problem.shift.to_i
    @ops = problem.select { |word| word =~ /^[a-zA-Z]+$/ }
    @nums = problem.select { |word| word =~ /-?[0-9]+/ }.map(&:to_i)
  end
  
  def answer
    begin
      (0...ops.size).each { |i| self.init = init.send(OPS[ops[i]], nums[i]) }
    rescue TypeError
      raise ArgumentError
    end
    init
  end
end