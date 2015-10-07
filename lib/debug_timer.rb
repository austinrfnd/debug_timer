require 'logger'
require "debug_timer/version"
require "debug_timer/config"
require "debug_timer/logger"
require "debug_timer/node"
require "debug_timer/node_printer"

module DebugTimer
  def self.start(name = '---', &block)
    parent = @current_node

    @current_node = Node.new(name)
    result = yield
    @current_node.stop()

    if parent
      parent.children << @current_node
    else
      print_tree(@current_node)
    end

    result
    ensure
      @current_node = parent
  end

  private

  def self.gather_nodes(node, depth = 0)
    nodes = []
    nodes << node.print(depth: depth)
    node.children.each do |node|
      nodes = nodes + gather_nodes(node, depth+1)
    end
    nodes
  end

  def self.print_tree(node)
    nodes_output = gather_nodes(node, 0).join("\n")
    logger.info(nodes_output)
  end
end
