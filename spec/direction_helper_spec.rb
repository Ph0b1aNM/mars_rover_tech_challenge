require_relative 'spec_helper'
require_relative '../lib/direction_helper'

describe DirectionHelper do
  describe '.change_orientation' do
    context "given a 'L' or 'R'" do
      it 'changes orientation' do
        expect(subject.change_orientation('N', 'L')).to eq('W')
        expect(subject.change_orientation('N', 'R')).to eq('E')
        expect(subject.change_orientation('W', 'R')).to eq('N')
        expect(subject.change_orientation('S', 'L')).to eq('E')
      end
    end
  end

  describe '.move_values' do
    context "given the orientation'" do
      it 'gives appropriate x, y move values' do
        expect(subject.move_values('N')).to eq([0, 1])
        expect(subject.move_values('E')).to eq([1, 0])
        expect(subject.move_values('S')).to eq([0, -1])
        expect(subject.move_values('W')).to eq([-1, 0])
      end
    end
  end

  describe '.move' do
    context "given the orientation and current position'" do
      it 'gives the new position' do
        expect(subject.move('N', 0, 0)).to eq([0, 1])
        expect(subject.move('W', 1, 2)).to eq([0, 2])
        expect(subject.move('E', 1, 2)).to eq([2, 2])
        expect(subject.move('S', 1, 2)).to eq([1, 1])
      end
    end
  end
end