describe DebugTimer::NodePrinter do
  let :node do
    DebugTimer::Node.new('asdf')
  end

  it "should print a string" do
    node.stop
    printer = DebugTimer::NodePrinter.new(node)
    expect(printer.print(1)).to be_kind_of(String)
  end
end