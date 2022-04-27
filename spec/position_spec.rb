require_relative '../lib/position'

describe Position do
  let(:position) { Position.new(12, 12) }

  describe '#move_towards' do
    it 'Move LEFT to right place' do
      expect(position.move_towards(Direction.new(Direction::LEFT), 12)).to eq Position.new(0, 12)
    end
  end
end
