# string testing

describe String do
  let(:favorite_color) { String.new('blue') }

  context 'when a let variable is used' do
    it 'is the value of assigned let variable' do
      expect(favorite_color).to eq('blue')
    end
  end

  context 'when the let variable is overriden' do
    let(:favorite_color) { String.new('green') }

    it 'is the updated value of the let variable' do
      expect(favorite_color).to eq('green')
    end
  end

  context 'when the overriden value is out of scope' do
    it 'is the value of original let variable' do
      expect(favorite_color).to eq('blue')
    end
  end
end

# ASSIGNMENT

describe String do
  let(:favorite_food) { String.new('tacos')}

  it 'is equal to tacos' do
    expect(favorite_food).to eq('tacos')
  end

  context 'when favorite food is updated' do
    let(:favorite_food) { String.new('meat')}

    it 'updates the favorite food' do
      expect(favorite_food).to eq('meat')
    end
  end
end


