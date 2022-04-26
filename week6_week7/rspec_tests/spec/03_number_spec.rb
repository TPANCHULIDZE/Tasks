# frozen_string_literal: true

# In a typical workflow, the class being tested will be located in a separate
# file from the tests. But for this simple example, let's keep everything together.
class SingleDigit
  attr_reader :number

  def initialize
    @number = rand(1..9)
  end
end

describe SingleDigit do
  subject(:random_digit) { SingleDigit.new }

  it 'is greater than or equal to 1' do
    expect(random_digit.number).to be >= 1
  end

  it 'is less than 10' do
    expect(random_digit.number).to be < 10
  end

  context 'when tests can be compounded' do
    it 'is greater than 0 and less than 10' do
     expect(random_digit.number).to be_positive.and be < 10
    end
  end

  context 'when using not_to' do
    it 'is not equal to 10' do
      expect(random_digit.number).not_to eq(10)
    end

    it 'is not equal to 0' do
      expect(random_digit.number).not_to be_zero
    end

    it 'is not nil' do
      expect(random_digit.number).not_to be_nil
    end
  end
end

# ASSIGNMENT

describe Array do
  context 'when my_array has perfect values' do
    let(:my_array) { [-1] + (-9..101).to_a + [98] }

    it 'has a specific first value' do
      expect(my_array.first).to be_odd.and be <= -1
    end

    it 'has a specific last value' do
      expect(my_array.last).to be_even.and be < 99
    end

    it 'has a specific min value' do
      expect(my_array.min).not_to be < -9
    end

    it 'has a specific max value' do
      expect(my_array.max).to be > 100
    end

    it 'includes a value of 42' do
      expect(my_array).to include(42)
    end

    it 'has a fourth element' do
      expect(my_array[3]).not_to be_nil
    end
  end
end
