describe DebugTimer do
  context 'start' do
    it "should yield the block" do
      DebugTimer.object_allocations = true
      yielded = DebugTimer.start("yo ho yo ho a pirate's life for me") do
        DebugTimer.start('pirate insider') do
          "Black"
        end
        attr = []
        8.times do |x|
          attr << "foobar#{x}"
          attr << Array.new(1_000_000/8)
        end
        'Jack'
      end
      expect(yielded).to eql("Jack")
      DebugTimer.object_allocations = false
    end
  end
end