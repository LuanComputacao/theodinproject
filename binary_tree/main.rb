class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other)
    data <=> other.data
  end
end

class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def build_tree(array)
    return nil if array.empty?

    mid = array.size / 2
    node = Node.new(array[mid])
    node.left = build_tree(array[0...mid])
    node.right = build_tree(array[(mid + 1)..-1])
    node
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if value < node.data
      node.left = insert(value, node.left)
    elsif value > node.data
      node.right = insert(value, node.right)
    end
    node
  end

  def delete(value, node = @root)
    return nil if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      successor = min_value_node(node.right)
      node.data = successor.data
      node.right = delete(successor.data, node.right)
    end
    node
  end

  def min_value_node(node)
    current = node
    current = current.left until current.left.nil?
    current
  end

  def find(value, node = @root)
    return nil if node.nil?
    return node if value == node.data

    value < node.data ? find(value, node.left) : find(value, node.right)
  end

  def level_order
    return [] if @root.nil?

    queue = [@root]
    result = []

    until queue.empty?
      node = queue.shift
      block_given? ? yield(node) : result << node.data
      queue << node.left if node.left
      queue << node.right if node.right
    end

    result unless block_given?
  end

  def inorder(node = @root, result = [], &block)
    return result if node.nil?

    inorder(node.left, result, &block)
    block_given? ? yield(node) : result << node.data
    inorder(node.right, result, &block)

    result unless block_given?
  end

  def preorder(node = @root, result = [], &block)
    return result if node.nil?

    block_given? ? yield(node) : result << node.data
    preorder(node.left, result, &block)
    preorder(node.right, result, &block)

    result unless block_given?
  end

  def postorder(node = @root, result = [], &block)
    return result if node.nil?

    postorder(node.left, result, &block)
    postorder(node.right, result, &block)
    block_given? ? yield(node) : result << node.data

    result unless block_given?
  end

  def height(node = @root)
    return -1 if node.nil?

    1 + [height(node.left), height(node.right)].max
  end

  def node_height(value)
    node = find(value)
    node ? height(node) : nil
  end

  def depth(value, node = @root, current_depth = 0)
    return nil if node.nil?
    return current_depth if value == node.data

    value < node.data ? depth(value, node.left, current_depth + 1) : depth(value, node.right, current_depth + 1)
  end

  def balanced?(node = @root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)
  end

  def rebalance
    array = inorder
    @root = build_tree(array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

# Create a BST with 15 random numbers
tree = Tree.new(Array.new(15) { rand(1..100) })
puts 'Initial tree:'
tree.pretty_print

# Check if balanced
puts "Is balanced? #{tree.balanced?}"

# Print traversals
puts "Level order: #{tree.level_order}"
puts "Preorder: #{tree.preorder}"
puts "Inorder: #{tree.inorder}"
puts "Postorder: #{tree.postorder}"

# Unbalance the tree
[101, 150, 200].each { |n| tree.insert(n) }
puts "\nAfter unbalancing:"
tree.pretty_print

# Check if balanced
puts "Is balanced? #{tree.balanced?}"

# Rebalance the tree
tree.rebalance
puts "\nAfter rebalancing:"
tree.pretty_print

# Check if balanced
puts "Is balanced? #{tree.balanced?}"

# Print traversals
puts "Level order: #{tree.level_order}"
puts "Preorder: #{tree.preorder}"
puts "Inorder: #{tree.inorder}"
puts "Postorder: #{tree.postorder}"
