require 'simplecov'
require 'minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!
SimpleCov.start

require_relative 'todolist'

class TodoListTest < MiniTest::Test
  attr_reader :todo1, :todo2, :todo3, :todos, :list
  
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(todos, list.to_a)
  end
  
  def test_size
    assert_equal(3, list.size)
  end
  
  def test_first
    assert_equal(todo1, list.first)
  end
  
  def test_last
    assert_equal(todo3, list.last)
  end
  
  def test_shift
    assert_equal(todo1, list.shift)
    assert_equal([todo2, todo3], list.to_a)
  end
  
  def test_pop
    assert_equal(todo3, list.pop)
    assert_equal([todo1, todo2], list.to_a)
  end
  
  def test_done?
    assert_equal(false, list.done?)
    list.done!
    assert_equal(true, list.done?)
  end
  
  def test_type_error
    assert_raises(TypeError) { list << 'a' }
  end
  
  def test_shovel
    list << Todo.new("Write test")
    assert_equal(4, list.size)
  end
  
  def test_add
    list.add(Todo.new("Write test"))
    assert_equal(4, list.size)
  end
  
  def test_item_at
    assert_equal(todo2, list.item_at(1))
    assert_raises(IndexError) { list.item_at(6) }
  end
  
  def test_mark_done_at
    list.mark_done_at(2)
    assert_equal(true, todo3.done?)
    assert_raises(IndexError) { list.mark_done_at(7) }
  end
  
  def test_mark_undone_at
    assert_raises(IndexError) { list.mark_undone_at(100) }
    todo1.done!
    todo2.done!
    todo3.done!
  
    list.mark_undone_at(1)
  
    assert_equal(true, todo1.done?)
    assert_equal(false, todo2.done?)
    assert_equal(true, todo3.done?)
  end
  
  def test_done!
    list.done!
    assert_equal(true, todo1.done?)
    assert_equal(true, todo2.done?)
    assert_equal(true, todo3.done?)
    assert_equal(true, list.done?)
  end
  
  def test_remove_at
    assert_raises(IndexError) { list.remove_at(5) }
    list.remove_at(2)
    assert_equal([todo1, todo2], list.to_a)
  end
  
  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_one_done
    list.mark_done_at(1)
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_all_done
    list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end
  
  def test_each
    test_arr = []
    list.each { |todo| test_arr << todo }
    assert_equal(list.to_a, test_arr)
  end
  
  def test_each_return
    assert_equal(list, list.each {  })
  end
  
  def test_select
    list.mark_done_at(1)
    new_list = list.select { |todo| todo.done? }
    assert_instance_of(TodoList, new_list)
    assert_equal([todo2], new_list.to_a)
    assert_equal([todo1, todo2, todo3], list.to_a)
  end

end