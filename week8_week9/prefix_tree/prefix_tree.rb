# create prefix tree

require_relative 'node'

WORD_EXIST = "This word is already exist in prefix tree"
ADD_NEW_WORD = "Add new word in prefix tree"
HAVE_TO_BE_STRING = 'Input value must to be string'

class PrefixTree
  def initialize()
    @root = Node.new
  end

  def add(input_value)
    if check_validate(input_value)
      add_good_word(input_value.downcase)
    else
      HAVE_TO_BE_STRING
    end
  end

  def delete(input_value)
    decrease_size(input_value)
    delete_nodes(input_value)
  end

  def include?(input_value)
    node = @root
    input_value.each_char do |char|
      node = find_node(node, char)
      return false unless node
    end
    node.is_end_point
  end

  def list
    Node.nodes
  end

  private

  def add_good_word(input_value)
    return WORD_EXIST if include?(input_value) 
    
    fill_tree(input_value)
    ADD_NEW_WORD
  end

  def fill_tree(input_value)
    node = @root
    input_value.each_char do |char|
      node = create_or_find_node(node, char)
      node.increment_size
    end
    node.become_end_point
  end

  def check_validate(input_value)
    input_value.is_a? String
  end

  def create_or_find_node(node, char)
    if node.include?(char)
      node.find(char)
    else
      node.create_child(char)
    end
  end

  def find_node(node, char)
    if node.include?(char)
      node.find(char)
    else
      false
    end
  end

  def decrease_size(input_value)
    node = @root
    input_value.each_char do |char|
      node = node.find(char)
      node.decrement_size
    end
  end

  def delete_nodes(input_value)
    node = @root
    input_value.each_char do |char|
      break unless node
      node.delete_node
      node = node.find(char)
    end
  end
end

tree = PrefixTree.new

puts tree.add('string')
tree.add('strw')
tree.add('str')

puts tree.list

# puts tree.include?("string")
# puts tree.include?("strw")
# puts tree.include?("str")
# puts tree.include?("stringa")
# puts tree.include?("strig")
# tree.delete('strw')
# puts tree.include?("strw")
# puts tree.include?("string")
# puts tree.add('strw')
# puts tree.add('strw')
# puts tree.include?("strw")
# puts tree.include?("string")
# tree.delete('string')
# puts tree.include?("strw")
# puts tree.include?("string")

