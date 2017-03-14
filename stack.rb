class Stack
  def initialize
    @stk = []
  end

  def push(value)
    @stk << value
  end

  def pop
    @stk.pop
  end

  def top
    @stk.unshift
  end

  def empty
    @stk.empty?
  end

  def get_elements
    @stk.each{|element| puts element}
  end
end

s = Stack.new
s.push(1)
s.push(2)
s.push(3)
s.push(4)
s.push(5)
puts " After pushing First 5 element"
s.get_elements
s.pop
puts " After poping  First element"
s.get_elements
puts "Top Element"
puts s.top
