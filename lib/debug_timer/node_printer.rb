module DebugTimer
  class NodePrinter
    def initialize(node)
      @node = node
    end

    # Should return a string of the printed
    def print(depth)
      spaces = "    ".freeze * depth
      "#{left_stats} #{spaces} └── #{@node.name}"
    end

    private
    def left_stats
      stats = [seconds_elapsed]
      if DebugTimer.object_allocations?
        stats << total_objects_allocated
      end
      stats.join(" | ")
    end

    def total_objects_allocated
      @node.start_gc_stats[:TOTAL] - @node.end_gc_stats[:TOTAL]
    end

    def seconds_elapsed
      [0.0001, @node.time_elapsed].max.round(4).to_s.ljust(6, '0'.freeze)
    end
  end
end