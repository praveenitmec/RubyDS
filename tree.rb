class Node
  attr_accessor :right, :left, :value

  def initialize(value, right, left)
    @value = value
    @right = right
    @left = left
  end
end

class Tree
  def initialize(value)
    @root = Node.new(value, nil, nil)
  end

  def add(value)
    node = Node.new(value, nil, nil)
    if @root == nil
      @root = Node.new(value, nil, nil)
      return
    end
    current_node = @root
    loop do
      if value <= current_node.value
        puts "going left"
        if current_node.left == nil
          puts "Inserted left"
          current_node.left = node
          break
        end
        current_node = current_node.left
      else
        puts "going right"
        if current_node.right == nil
          puts "Inserted right"
          current_node.right = node
          break
        end
        current_node = current_node.right
      end
    end
  end

  # Pre-Order Traversal
  def preOrderTraversal(node= @root)
    return if (node == nil)
    preOrderTraversal(node.left)
    preOrderTraversal(node.right)
    puts node.value.to_s
  end

  # Post-Order Traversal
  def postOrderTraversal(node = @root)
    return if (node == nil)
    puts node.value.to_s
    postOrderTraversal(node.left)
    postOrderTraversal(node.right)
  end

  # In-Order Traversal : Displays the final output in sorted order
  # Display smaller children first (by going left)
  # Then display the value in the current node
  # Then display the larger children on the right
  def inOrderTraversal(node = @root)
    return if (node == nil)
    inOrderTraversal(node.left)
    puts node.value.to_s
    inOrderTraversal(node.right)
  end

  def delete(value)
    if @root.value == value
      if @root.left == nil && @root.right != nil
        @root = @root.right
      elsif @root.left == nil && @root.right != nil
        @root = @root.left
      elsif @root.left != nil && @root.right != nil
        temp = @root.right
        @root = @root.left
        @root.right = temp
      end
      @root = nil
      return
    end
    left,right = false,false
    parent_node = @root
    node = @root.left if value < @root.value
    node = @root.right if value > @root.value
    loop do
      if value < node.value
        left = true
        node = node.left
      elsif value > node.value
        right = true
        node = node.right
      else
        if node.left == nil && node.right != nil
          parent_node.left = node.right if left
          parent_node.right = node.right if right
        elsif node.left != nil && node.right == nil
          parent_node.left = node.right if left
          parent_node.right = node.right if right
        elsif node.left != nil && node.right != nil
          temp = node.left
          parent_node.left = temp if left
          parent_node.right = temp if right
          temp.right = node.right
        end
        node = nil
        return
      end
      left,right = false,false
      parent_node = node
    end
  end
end

t = Tree.new(5)
t.add(9)
t.add 11
t.add 3
t.add 10
t.add(12)
t.delete(9)
