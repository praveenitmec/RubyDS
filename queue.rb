class Queue
  def initialize
    @que = []
  end

  def enqueue(value)
    @que << value
  end

  def dequeue
    @que.shift
  end

  def top
    @que.first
  end

  def empty
    @que.empty?
  end

  def get_elements
    @que.each{|element| puts element}
  end
end

q = Queue.new
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)
q.enqueue(5)
puts " After pushing First 5 element"
q.get_elements
q.dequeue
puts " After dequeuing  First element"
q.get_elements
puts " First elemnt"
puts q.top
