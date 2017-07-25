describe DebugTimer::NodePrinter do
  let :node do
    DebugTimer::Node.new('asdf')
  end
  context 'object_allocations set to true' do
    before :each do
      DebugTimer.object_allocations = true
    end

    it "should print a string" do
      node.stop
      printer = DebugTimer::NodePrinter.new(node)
      expect(printer.print(1)).to be_kind_of(String)
    end

    it "should include data allocation output" do
      node.stop
      printer = DebugTimer::NodePrinter.new(node)
      expect(printer.print(1)).to match(/T_OBJECT/)
    end
  end

  context "object_allocations set to false" do
    before :each do
      DebugTimer.object_allocations = false
    end

    it "should not include data allocation output" do
      node.stop
      printer = DebugTimer::NodePrinter.new(node)
      expect(printer.print(1)).to_not match(/T_OBJECT/)
    end
  end
end
