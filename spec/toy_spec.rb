require 'spec_helper'

describe Toy do
  let(:grid) { GridTable.new }
  let(:toy) { Toy.new(grid) }

  context 'interprets correct command' do
    before do
      toy.perform("PLACE 0,0,NORTH")
      toy.perform("MOVE")
      toy.perform("RIGHT")
      toy.perform("MOVE")
    end

    it 'should be in correct position' do
      expect(toy.report).to eq("1,1,EAST")
    end

    it 'should ignore invalid commands' do
      expect { toy.perform("PLACE12NORTH") }.to raise_error(ArgumentError)
      expect { toy.perform("LEFFT") }.to raise_error(ArgumentError)
      expect { toy.perform("RIGHTT") }.to raise_error(ArgumentError)
    end
  end

  context 'place output and exceptions' do
    it 'returns correct exceptions' do
      expect { toy.place(nil, nil, :east) }.to raise_error(TypeError)
      expect { toy.place(1, 'abc', nil) }.to raise_error(TypeError)
      expect { toy.place(1, 0, :northeast) }.to raise_error(TypeError)
    end

    it 'place with correct params' do
      expect(toy.place(0, 1, :north)).to eq(true)
      expect(toy.place(2, 2, :south)).to eq(true)
    end

    it 'not placed because of wrong params' do
      expect(toy.place(6, 6, :west)).to eq(false)
      expect(toy.place(-1, 5, :east)).to eq(false)
    end
  end

  context 'move correctly' do
    before do
      toy.place(0, 0, :north)
    end

    it 'should return true' do
      expect(toy.move).to eq(true)
    end

    it 'should have correct positions' do
      toy.move
      expect(toy.position[:x]).to eq(0)
      expect(toy.position[:y]).to eq(1)
    end
  end

  context 'rotate correctly' do
    before do
      toy.place(0, 0, :north)
    end

    it 'should return back to north from left' do
      expect(toy.rotate_left).to eq(:west)
      expect(toy.rotate_left).to eq(:south)
      expect(toy.rotate_left).to eq(:east)
      expect(toy.rotate_left).to eq(:north)
    end

    it 'should return back to north from right' do
      expect(toy.rotate_right).to eq(:east)
      expect(toy.rotate_right).to eq(:south)
      expect(toy.rotate_right).to eq(:west)
      expect(toy.rotate_right).to eq(:north)
    end
  end

  context 'toy report' do
    before do
      toy.place(5, 5, :east)
    end

    it 'should report correct position and direction' do
      expect(toy.report).to eq("5,5,EAST")
    end
  end
end
