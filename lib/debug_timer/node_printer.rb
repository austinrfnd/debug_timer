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
        stats << "T_OBJECT: #{total_objects_allocated}"
        stats << "FREE: #{total_free_count}"
      end
      stats.join(" | ")
    end

    def total_objects_allocated
      @node.end_gc_stats[:T_OBJECT] - @node.start_gc_stats[:T_OBJECT]
    end

    def total_free_count
      @node.end_gc_stats[:FREE] - @node.start_gc_stats[:FREE]
    end

    def seconds_elapsed
      [0.0001, @node.time_elapsed].max.round(4).to_s.ljust(6, '0'.freeze)
    end
  end
end
