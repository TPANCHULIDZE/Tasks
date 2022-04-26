# frozen_string_literal: true

require_relative '../lib/11c_dog'
require_relative '../spec/11a_shared_example_spec'

describe Dog do
  subject(:toby) { described_class.new('Toby', nil, 'brown') }

  context 'when Dog is a child class of Pet' do
    include_examples 'base class method name'
  end

  context 'when dog has name and color, but no breed' do
    it 'has name, breed & color attributes' do
      expect(toby).to have_attributes(name: 'Toby', breed: nil, color: 'brown')
    end
  end
end

# ASSIGNMENT - complete either Cat or Dog assignment

describe Dog do
  subject(:mike) { Dog.new(name: 'Mike', breed: 'Geman Shepherd', color: 'black') }
  context 'mike is talk' do
      include_examples 'shared method name'
  end

  it 'is not barking' do
    expect(mike).not_to be_barking
  end

  it 'is sleeping' do
    expect(mike).to be_sleeping
  end
end
