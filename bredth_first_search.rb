require "set"

class Node
  attr_accessor :name, :adjacents

  def initialize(name)
    @adjacents = Set.new
    @name = name
  end

  def to_s
    @name
  end
end

class Graph

  # for undirected graphs direction given on both sides
  def add_edge(node_a, node_b)
    node_a.adjacents << node_b
    node_b.adjacents << node_a
  end
end

class BreadthFirstSearch
  def initialize(graph, source_node)
    @graph = graph
    @node = source_node
    @visited = []
    @edge_to = {}

    bfs(source_node)
  end

  def edge_to(node)
    @edge_to[node]
  end

  def shortest_path_to(node)
    return unless has_path_to?(node)
    path = []

    while(node != @node) do
      path.unshift(node) # unshift adds the node to the beginning of the array
      node = @edge_to[node]
    end

    path.unshift(@node)
  end

  private
  def bfs(node)
    # Remember, in the breadth first search we always
    # use a queue. In ruby we can represent both
    # queues and stacks as an Array, just by using
    # the correct methods to deal with it. In this case,
    # we use the "shift" method to remove an element
    # from the beginning of the Array.

    # First step: Put the source node into a queue and mark it as visited
    queue = []
    queue << node
    @visited << node

    # Second step: Repeat until the queue is empty:
    # - Remove the least recently added node n
    # - add each of n's unvisited adjacents to the queue and mark them as visited
    while queue.any?
      current_node = queue.shift # remove first element
      current_node.adjacents.each do |adjacent_node|
        next if @visited.include?(adjacent_node)
        queue << adjacent_node
        @visited << adjacent_node
        @edge_to[adjacent_node] = current_node
      end
    end
  end

  # If we visited the node, so there is a path
  # from our source node to it.
  def has_path_to?(node)
    @visited.include?(node)
  end
end

#Example

node1 = Node.new("Node #1")
node2 = Node.new("Node #2")
node3 = Node.new("Node #3")
node4 = Node.new("Node #4")
node5 = Node.new("Node #5")

graph = Graph.new
graph.add_edge(node1, node2)
graph.add_edge(node1, node3)
graph.add_edge(node2, node3)
graph.add_edge(node2, node4)
graph.add_edge(node4, node5)
graph.add_edge(node3, node5)

bfs = BreadthFirstSearch.new(graph, node1)
puts bfs.shortest_path_to(node5)
