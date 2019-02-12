require_relative 'spec_helper'
require_relative '../lib/mars_rover'

describe RoverNavigation do
  describe '.nasa_command' do
    context 'given orientation ' do
      it 'returns the new orientation' do
        subject = RoverNavigation.new(0, 0, 'N')
        expect(subject.nasa_command('L')).to eq([0, 0, 'W'])

        subject = RoverNavigation.new(0, 0, 'N')
        expect(subject.nasa_command('R')).to eq([0, 0, 'E'])

        subject = RoverNavigation.new(0, 0, 'N')
        expect(subject.nasa_command('RR')).to eq([0, 0, 'S'])

        subject = RoverNavigation.new(0, 0, 'S')
        expect(subject.nasa_command('LL')).to eq([0, 0, 'N'])
      end
    end

    context 'given a move ' do
      it 'returns the new position' do
        subject = RoverNavigation.new(0, 0, 'N')
        expect(subject.nasa_command('MM')).to eq([0, 2, 'N'])
      end
    end

    context 'given orientations & moves' do
      it 'returns the new position & orientation' do
        subject = RoverNavigation.new(1, 2, 'N')
        expect(subject.nasa_command('LM')).to eq([0, 2, 'W'])

        subject = RoverNavigation.new(1, 2, 'N')
        expect(subject.nasa_command('LMLMLMLMM')).to eq([1, 3, 'N'])

        subject = RoverNavigation.new(3, 3, 'E')
        expect(subject.nasa_command('MMRMMRMRRM')).to eq([5, 1, 'E'])
      end
    end
  end
end