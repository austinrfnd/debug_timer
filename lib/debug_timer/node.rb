module DebugTimer
  class Node
    attr_reader :name, :children, :start_time, :parent, :time_elapsed, :start_gc_stats, :end_gc_stats
    def initialize(name)
      @name = name
      @children = []
      if DebugTimer.object_allocations?
        grab_object_allocations(true)
      end
      @start_time = Time.now
    end

    def stop
      @time_elapsed = Time.now - start_time
      if DebugTimer.object_allocations?
        grab_object_allocations(false)
      end
    end

    def print(depth:)
      NodePrinter.new(self).print(depth)
    end

    private

    def grab_object_allocations(start)
      if start
        # GC.disable
        # puts ObjectSpace.count_objects.inspect
        @start_gc_stats = ObjectSpace.count_objects
      else
        # puts ObjectSpace.count_objects.inspect
        @end_gc_stats = ObjectSpace.count_objects
        # GC.enable
      end
    end
  end
end
