module DebugTimer
  def self.logger=(logger)
    @@logger = logger
  end

  def self.logger
    @@logger ||= Logger.new($stdout)
  end
end