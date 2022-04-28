# frozen_string_literal: true

require_relative '../lib/12_magic_seven'

describe MagicSeven do
  subject(:game) { described_class.new }

  describe '#add_nine' do
    it 'returns 15' do
      expect(game.add_nine(6)).to eq(15)
    end

    it 'returns 15' do
      random_number = 6

      result = game.add_nine(random_number)

      expect(result).to eq(15)
    end
  end

  describe '#multiply_by_two' do
    context 'when the previous step is 8' do
      it 'returns 16' do
        previous_step = 8 # Arrange
        result = game.multiply_by_two(previous_step) # Act
        expect(result).to eq(16) # Assert
      end
    end
  end

  # ASSIGNMENT
  
  describe '#subtract_four' do
    subject(:game) { described_class.new }

    it 'return 6' do
      expect(game.subtract_four(10)).to eq(6)
    end
  end

  describe '#divide_by_two' do
    subject(:game) { described_class.new }

    it 'result is 10' do
      expect(game.divide_by_two(20)).to eq(10)
    end
  end

  # The following tests will need you to create new instances of MagicSeven with
  # a specific value for the random_number.
  describe '#subtract_random_number' do
    subject(:game) { described_class.new(10) }

    it 'returns 11' do
      expect(game.subtract_random_number(21)).to eq(11)
    end
  end

  # The #play method will always return seven! Test this game, using any
  # integer as the random_number. Update the context with the number.
  describe '#play' do
    context 'when the random number is 10' do
      subject(:game) { described_class.new(10) }

      it 'will return 7' do
        expect(game.play).to eq(7)
      end
    end

    context 'when the random number is 15' do
      subject(:game) { described_class.new(15) }

      it 'will return 7' do
        expect(game.play).to eq(7)
      end
    end

    context 'when the random number is 1' do
      subject(:game) { described_class.new(1) }

      it 'will return 7' do
        expect(game.play).to eq(7)
      end
    end
  end
end
