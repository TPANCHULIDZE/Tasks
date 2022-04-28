# frozen_string_literal: true

require_relative '../lib/11b_cat'
require_relative '../spec/11a_shared_example_spec'

describe Cat do
  subject(:oscar) { described_class.new('Oscar', 'Maine Coon') }

  # Before you begin this file, make sure you have read the shared
  # example file: 11a_shared_examples_spec.rb. This test references
  # that file's first test in the below 'include_examples' line.
  context 'when Cat is a child class of Pet' do
    include_examples 'base class method name'
  end

  context 'when cat has name and breed, but no color' do
    it 'has name, breed & color attributes' do
      expect(oscar).to have_attributes(name: 'Oscar', breed: 'Maine Coon', color: nil)
    end
  end
end

# ASSIGNMENT - complete either Cat or Dog assignment
# (see 11c_dog_spec.rb for Dog assignment)

describe Cat do
  # Create a subject with your choice of cat name and optional breed/color.
  subject(:garfield) { described_class.new('Garfield', 'no breed', 'red')}
  # Write a test using the second shared_example to test that cat responds to
  # talk ('meow').
  context 'garfield say meow' do
    include_examples 'shared method name'
  end

  
  it 'is not hungry' do
    expect(garfield).not_to be_hungry
  end

  it 'is hiding' do
    expect(garfield).to be_hiding
  end
end
