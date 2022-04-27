require_relative '../lib/position'

describe Position do
  let(:position) { Position.new(12, 12) }

  describe '#move_towards' do
    it 'Move towards LEFT' do
      expect(position.move_towards(Direction.new(Direction::LEFT), 12)).to eq(Position.new(0, 12))
    end
  end

  describe "#copy!" do
    it "Copy from a position instance" do
      position.copy!(Position.new(10, 10))
      actual = position
      expected = Position.new(10, 10)

      expect(actual).to eq(expected)
    end
  end
end
