require 'pry'

class Bst
  attr_reader :data, :left, :right
  
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
  
  def insert(val)
    if val <= data
      left.nil? ? self.left = Bst.new(val) : left.insert(val)
    else
      right.nil? ? self.right = Bst.new(val) : right.insert(val)
    end
  end

  def each
    return build_vals.to_enum unless block_given?
    build_vals.each { |val| yield val }
  end
  
  private
  
  def build_vals(vals = [], node = self)
    build_vals(vals, node.left) unless node.left.nil?
    vals << node.data
    build_vals(vals, node.right) unless node.right.nil?
    vals
  end
  
  attr_writer :left, :right
end