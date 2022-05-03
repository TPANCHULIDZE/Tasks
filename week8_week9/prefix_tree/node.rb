#create node class

class Node
  attr_reader :value, :number_size, :children, :is_end_point
  
  @@nodes = []

  def initialize(value)
    @value = value
    @children ||= []
    @number_size = 0
    @@nodes << self
    @is_end_point = false
  end

  def delete_node
    @children.delete_if { |node| node.number_size.zero? }
  end

  def self.nodes
    @@nodes
  end

  def to_s
    @value
  end

  def include?(char)
    @children.any? { |node| node.value == char }
  end

  def find(char)
    @children.each { |node| return node if node.value == char }
    false
  end

  def become_end_point
    @is_end_point = true
  end

  def increment_size
    @number_size += 1
  end

  def decrement_size
    @number_size -= 1
  end

  def create_child(char)
    @children << child = Node.new(char)
    child
  end
end

