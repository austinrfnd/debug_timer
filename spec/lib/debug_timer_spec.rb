describe DebugTimer do
  context 'start' do
    it "should yield the block" do
      yielded = DebugTimer.start("yo ho yo ho a pirate's life for me") do
        DebugTimer.start('pirate insider') do
          "Black"
        end
        'Jack'
      end
      expect(yielded).to eql("Jack")
    end
  end
end