describe "DebugTimer configure" do
  it "should default object_allocations to false" do
    expect(DebugTimer.object_allocations?).to be_falsey
  end

  context 'configure' do
    it "should return set object_allocations" do
      DebugTimer.configure do |config|
        config.object_allocations = true
      end
      expect(DebugTimer.object_allocations?).to be_truthy
    end
  end
end