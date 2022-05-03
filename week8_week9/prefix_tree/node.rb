#create node class

class Node
  attr_reader :value, :number_size, :children, :is_end_point, :strings_indexs
  
  @@nodes = []

  def initialize(value = 'root')
    @value = value
    @children ||= []
    @strings_indexs = []
    @number_size = 0
    @@nodes << self
    @is_end_point = false
  end

  def create_child(char)
    @children << child = Node.new(char)
    child
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

  def not_end_point
    @is_end_point = false
  end

  def increment_size
    @number_size += 1
  end

  def decrement_size
    @number_size -= 1
  end

  def add_strings_indexs(index)
    @strings_indexs << index
  end

  def delete_strings_indexs
    @children.each do |node|
      erase_indexs(node)
    end
  end

  def delete_element(value)
    @strings_indexs.delete_if { |element| element.eql? value }
  end

  def erase_indexs(node)
    if node.number_size.zero?
      @strings_indexs -= node.strings_indexs
    end
  end
end
