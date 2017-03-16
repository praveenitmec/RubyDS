require 'set'
class Node
  attr_accessor :value, :adjacents

  def initialize(value)
    @value = value
    @adjacents = Set.new
  end

  def to_s
    @value
  end
end

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def add_edge(from, to)
    from.adjacents << to
  end
end

class TopologicalSort

  attr_accessor :post_order

  def initialize(graph)
    @post_order = []
    @visited =[]
    graph.nodes.each do |node|
      depthfirstsearch(node) unless @visited.include?(node)
    end
  end

  def depthfirstsearch(node)
    @visited << node
    node.adjacents.each do |an|
      depthfirstsearch(an) unless @visited.include?(an)
    end

    @post_order << node
  end
end

#ex
graph = Graph.new

graph.nodes << (node1 = Node.new("Node #1"))
graph.nodes << (node2 = Node.new("Node #2"))
graph.nodes << (node3 = Node.new("Node #3"))
graph.nodes << (node4 = Node.new("Node #4"))
graph.nodes << (node5 = Node.new("Node #5"))


graph.add_edge(node1, node2)
graph.add_edge(node1, node5)
graph.add_edge(node2, node3)
graph.add_edge(node2, node4)

TopologicalSort.new(graph).post_order.each{|n| p n.value}
