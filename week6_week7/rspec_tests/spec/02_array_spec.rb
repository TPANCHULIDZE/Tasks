# frozen_string_literal: true

describe Array do
  context 'when subject is implicitly defined' do
   it 'is an Array' do
      expect(subject).to be_an(Array)
    end
    
    it { is_expected.to be_an(Array) }
  end

  context 'when using predicate matchers' do
    context 'when using the empty? predicate method' do
      it 'returns true' do
        expect(subject.empty?).to eq true
      end
    end
    
    it 'is empty' do
      expect(subject).to be_empty
    end
    
    it { is_expected.to be_empty }
  end

  context 'when a let variable is declared inside a context block' do
    let(:numbers) { [3, 8, 9] }

    it 'has length of 3' do
      expect(numbers.length).to eq(3)
    end

    it 'changes the length to 2' do
      numbers.pop
      expect(numbers.length).to eq(2)
    end
  end
end

# ASSIGNMENT
describe Array do
  context 'when updating an implicit subject' do
   
    it 'is empty' do
      expect(subject).to be_empty
    end

    it 'updates length to 1' do
      subject.push(1)
      expect(subject.length).to eq(1)
    end
  end

  context 'when using one let variable on two tests' do
    let(:lucky_numbers) { [1, 1, 40] }

    
    it 'has length of 3' do
      expect(lucky_numbers.length).to eq(3)
    end

    it 'has sum of 42' do
      expect(lucky_numbers.sum).to eq(42)
    end
  end
end
