require 'pry'

class Element
  attr_reader :datum
  
  def initialize(datum = nil, next_node = nil)
    @datum = datum
    @next_node = next_node
  end
  
  def next
    next_node
  end
  
  def next=(node)
    @next_node = node
  end
  
  def tail?
    next_node.nil?
  end
  
  private
  
  attr_reader :next_node
end

class SimpleLinkedList
  attr_reader :head
  
  def size
    return 0 if head.nil?
    
    size = 1
    current_node = head
    until current_node.tail?
      size += 1
      current_node = current_node.next
    end
    size
  end
  
  def empty?
    size == 0
  end
  
  def push(val)
    if head.nil?
      self.head = Element.new(val)
    else
      temp_node = head
      self.head = Element.new(val)
      head.next = temp_node
    end
  end
  
  def peek
    head ? head.datum : head
  end
  
  def pop
    val = head.datum
    self.head = head.next
    val
  end
  
  def self.from_a(arr)
    list = new
    (arr || []).reverse_each { |val| list.push(val) }
    list
  end
  
  def to_a
    return [] if head.nil?
    
    arr = []
    current_node = head
      until current_node.nil?
        arr << current_node.datum
        current_node = current_node.next
      end
    arr
  end
  
  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end
  
  private
  
  attr_writer :head
end