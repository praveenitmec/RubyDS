class Node
  attr_accessor :value, :next

  def initialize(value, next_node)
    @value = value
    @next = next_node
  end
end

class LinkedList
   attr_accessor :head, :tail

  def initialize(value)
    @head = Node.new(value, nil)
    @tail = @head
  end

  def insert(value)
    @tail.next = Node.new(value, nil)
    @tail = @tail.next
  end

  def delete(value)
    current_node = @head
    next_node = @head.next
    while current_node.next != nil
      if next_node.value == value
        current_node.next = next_node.next
        break
      else
        current_node = next_node
        next_node = next_node.next
      end
    end
  end

  def get_list
    elements = []
    current_node = @head
    while current_node.next != nil
      elements << current_node.value
      current_node = current_node.next
    end
    elements << current_node.value
    elements
  end

  def lllength
    get_list.length
  end

  def empty?
    @head.nil?
  end

  def first
    raise "Lst is empty" if empty?
    @head.value
  end

  def last
    raise "Lst is empty" if empty?
    @tail.vaue
  end

  def inser_after(value, prev)
    current_node = @head
    while current_node.next != nil
      if current_node.value == prev
         break
      end
      current_node = current_node.next
    end
    if current_node.value == prev
      tmp = current_node.next
      current_node.next  = Node.new(value, tmp)
    end
  end

  def inser_before(value, next_v)
    current_node = @head
    if @head.value == next_v
      new_node = Node.new(value, @head)
      @head = new_node
    end
    while current_node.next != nil
      if current_node.next.value == next_v
        new_node = Node.new(value, current_node.next)
        current_node.next = new_node
        break
      end
      current_node = current_node.next
    end
  end
end

ll = LinkedList.new(1)
ll.insert(2)
ll.insert(3)
ll.insert(4)
ll.insert(5)
puts "After Insertng first 5 elements"
puts ll.get_list
ll.inser_after(6,2)
puts "After Insertng 6 after 2 elements"
puts ll.get_list
ll.inser_before(7,4)
puts "After inserting 7 before 4 Should print [1, 2, 6, 3, 7, 4, 5]"
puts ll.get_list
ll.delete(2)
puts "It Should print [1, 6, 3, 7, 4, 5]"
puts ll.get_list
