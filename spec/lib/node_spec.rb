describe DebugTimer::Node do
  let :node do
    n = DebugTimer::Node.new('asdf')
    'asdf'
    n.stop
    n
  end

  describe 'initialize' do
    it "should a name" do
      expect(node.name).to eql('asdf')
    end

    it "should initialize with empty children" do
      expect(node.children).to eql([])
    end

    it "should have a start_time" do
      k = Time.now
      expect(Time).to receive(:now) { k }
      node = DebugTimer::Node.new('asdf2')
      expect(node.start_time).to eql(k)
    end
  end

  context 'stop' do
    it "should set @time_elapsed" do
      node.stop
      expect(node.time_elapsed).to_not be_nil
    end
  end
end