# frozen_string_literal: true  

require_relative '../lib/14_find_number'

describe FindNumber do
  # There are two ways to specify the messages that a double can receive.

  describe '#initialize' do
    # Doubles are strict, which means you must specify (allow) any messages
    # that they can receive. If a double receives a message that has not been
    # allowed, it will trigger an error.

    # This first example creates the double, then allows specific methods.
    context 'when creating the double and allowing method(s) in two steps' do
      let(:random_number) { double('random_number') }
      subject(:game) { described_class.new(0, 9, random_number) }

      context 'when random_number is 8' do
        it 'returns 8' do
          allow(random_number).to receive(:value).and_return(8)
          solution = game.answer
          expect(solution).to eq(8)
        end
      end
    end

    # This second example creates the double & specific methods together.
    context 'when creating the double and allowing method(s) in one step' do
      # A hash can be used to define allowed messages and return values.
      # When passing a hash as the last argument, the { } are not required.
      # let(:random_number) { double('random_number', { value: 3 }) }
      let(:random_number) { double('random_number', value: 3) }
      subject(:game) { described_class.new(0, 9, random_number) }

      context 'when random_number is 3' do
        it 'returns 3' do
          solution = game.answer
          expect(solution).to eq(3)
        end
      end
    end

    # When testing the same method in multiple tests, it is possible to add
    # method names to subject.
    context 'when adding method names to subject for multiple tests' do
      let(:random_number) { double('random_number', value: 5) }
      subject(:game_solution) { described_class.new(0, 9, random_number).answer }

      context 'when random_number is 5' do
        it 'returns 5' do
          expect(game_solution).to eq(5)
        end
      end
    end
  end
end

# ASSIGNMENT


describe FindNumber do
  describe '#make_guess' do
    # Create a random_number double called 'number_guessing'. Allow the double
    # to receive 'value' and return the value of 8, in one of the two ways
    # explained above.
    let(:number_guessing) { double('number_guessing', value: 6)}
    subject(:game_guessing) { described_class.new(0, 9, number_guessing) }

    # Before you write the #make_guess method:
    # Write a test that would expect #make_guess to return the average of
    # the min and max values (rounded down). Don't expect this test to pass.
    # It will fail with an undefined method error because you haven't
    # written #make_guess yet!
    context 'when min is 0 and max is 9' do
      it 'returns 4' do
        solution = game_guessing.make_guess
        expect(solution).to eq(4)
      end
    end

    # Now write a method in 14_find_number.rb called #make_guess that returns
    # the average of the min and max values (rounded down).
    # You can now run the above test and it should pass.

    # Write a test for each of the following contexts. You will need to create a
    # new instance of FindNumber for each context, but you can use the same
    # random number double created inside this method's describe block.

    context 'when min is 5 and max is 9' do
      let(:number_guessing) { double('number_guessing', value: 6)}
      subject(:game_guessing) { described_class.new(5, 9, number_guessing) }

      it 'returns 7' do
        solution = game_guessing.make_guess
        expect(solution).to eq(7)
      end
    end

    context 'when min is 8 and max is 9' do
      let(:number_guessing) { double('number_guessing', value: 6)}
      subject(:game_guessing) { described_class.new(8, 9, number_guessing) }

      it 'returns 8' do
        solution = game_guessing.make_guess
        expect(solution).to eq(8)
      end
    end

    context 'when min is 0 and max is 3' do
      let(:number_guessing) { double('number_guessing', value: 6)}
      subject(:game_guessing) { described_class.new(0, 3, number_guessing) }

      it 'returns 1' do
        solution = game_guessing.make_guess
        expect(solution).to eq(1)
      end
    end

    context 'when min and max both equal 3' do
      let(:number_guessing) { double('number_guessing', value: 6)}
      subject(:game_guessing) { described_class.new(3, 3, number_guessing) }

      it 'returns 3' do
        solution = game_guessing.make_guess
        expect(solution).to eq(3)
      end
    end
  end

  # ASSIGNMENT: METHOD #2
  describe '#game_over?' do
    context 'when guess and random_number are equal' do
      let(:number_guessing) { double('number_guessing', value: 6)}
      subject(:game_guessing) { described_class.new(0, 9, number_guessing, 6) }

      # Create another subject and random_number double with meaningful names.
      # The subject will need to specify the number value of @guess.

      # Allow the double to receive 'value' and return the same number as @guess.

      # Write a test that would expect game to be_game_over when a guess equals
      # the random_number double's value above. Remember that this test will not
      # be able to pass yet because you haven't written the method!

      it 'is game over' do
        solution = game_guessing.game_over?
        expect(solution).to be_truthy
      end
    end

    # Write the corresponding method in 14_find_number.rb called #game_over?
    # that returns true when a guess equals the value of the random_number.

    # Write a test that would expect game to NOT be_game_over when a guess does
    # NOT equal the random_number double's value above.

    context 'when guess and random_number are not equal' do
      let(:number_guessing) { double('number_guessing', value: 6)}
      subject(:game_guessing) { described_class.new(0, 9, number_guessing, 7) }

      it 'is not game over' do
        solution = game_guessing.game_over?
        expect(solution).to be_falsy
      end
    end
  end

  # ASSIGNMENT: METHOD #3
  describe '#update_range' do
    # As you have seen above, you can share the same random_number double for
    # multiple context blocks, by declaring it inside the describe block.
    let(:number_range) { double('random_number', value: 8) }

    # Write four tests for #update_range that test the values of min and max.

    # When the guess is less than the answer:
    # - min updates to one more than the guess
    # - max stays the same

    # When the guess is more than the answer:
    # - min stays the same
    # - max updates to one less than the guess

    context 'when the guess is less than the answer' do
      subject(:low_guess_game) { described_class.new(0, 9, number_range, 4) }

      it 'updates min to 5' do
        low_guess_game.update_range
        min = low_guess_game.min
        expect(min).to eq(5)
      end

      it 'does not update max' do
        low_guess_game.update_range
        new_max = low_guess_game.max
        expect(new_max).to eq(9)
      end
    end

    context 'when the guess is more than the answer' do
      subject(:high_guess_game) { described_class.new(0, 9, number_range, 9) }

      it 'does not update min' do
        high_guess_game.update_range
        min = high_guess_game.min
        expect(min).to eq(0)
      end

      it 'updates max to 8' do
        high_guess_game.update_range
        max = high_guess_game.max
        expect(max).to eq(8)
      end
    end

    # Now, write the method in 14_find_number.rb called #update_range that will
    # do the following:

    # When the guess is less than the answer:
    # - min updates to one more than the guess

    # When the guess is not less than the answer:
    # - max updates to one less than the guess

    # Write a test for any 'edge cases' that you can think of, for example:

    context 'when the guess is 7, min=5, and max=8' do
      subject(:game_guessing) { described_class.new(5, 8, number_range,7) }
      it 'updates min to the same value as max' do
        game_guessing.update_range
        min = game_guessing.min
        max = game_guessing.max
        expect(min).to eq(max)
      end

      it 'does not update max' do
        max = game_guessing.max
        game_guessing.update_range
        new_max = game_guessing.max
        expect(new_max).to eq(max)
      end 
    end
  end
end
