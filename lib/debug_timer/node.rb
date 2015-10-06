module DebugTimer
  class Node
    attr_reader :name, :children, :start_time, :parent, :time_elapsed

    def initialize(name)
      @name = name
      @children = []
      @start_time = Time.now
    end

    def stop
      @time_elapsed = Time.now - start_time
    end

    def print(depth:)
      seconds = [0.0001, time_elapsed].max.round(4).to_s.ljust(6, '0')
      spaces = "    " * depth

      "#{seconds} #{spaces}└── #{name}"
    end
  end
end