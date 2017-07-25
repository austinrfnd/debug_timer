module DebugTimer
  @@object_allocations = false

  def self.configure
    yield self
  end

  def self.object_allocations=(object_allocations)
    @@object_allocations = object_allocations
  end

  def self.object_allocations?
    @@object_allocations
  end
end
