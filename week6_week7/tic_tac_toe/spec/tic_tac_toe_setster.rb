# tester for tic_tac_toe game

require '../tic_tac_toe'
require 'rspec/autorun'

describe TicTacToe do
  describe "#initialize" do      
    context "check boards and players" do
      let(:first_player){ 'ruby' }
      let(:second_player){ 'java' }
      subject(:game) { described_class.new(first_player, second_player) }
      subject(:empty_board) { [['_','_', '_'],['_','_', '_'],['_','_', '_']]}
         
      it "check board is exist" do
        expect(game).to respond_to(:board)
      end

      it "check borad is empty" do
        expect(game.board).to eq(empty_board)  
      end

      it "check players names" do
        expect(game.players).to eq([first_player,second_player])
      end
    end
  end

  describe "#player_turn" do
    context "player gets information" do
      subject(:game) { described_class.new('ruby', 'java') }

      it "input 1 1 cordinate" do
        first_place = '1 1'
        allow(game).to receive(:player_turn).and_return(first_place)
      end

      it "inputs 1 s cordinate" do
        game.current_cord = [1, 's']
        warning_message = NOT_IN_RANGE_OR_NOT_INTEGER + "\n"
        expect { game.player_turn }.to output(warning_message).to_stdout
      end

      it "inputs 1 4 cordinate" do
        game.current_cord = [1, 4]
        warning_message = NOT_IN_RANGE + "\n"
        expect { game.player_turn }.to output(warning_message).to_stdout
      end

      it "inputs 1 4 cordinate" do
        game.board = [['X','X', 'X'],['_','O', '_'],['_','O', '_']]
        game.current_cord = [1, 3]
        warning_message = MARKED_PLACE + "\n"
        expect { game.player_turn }.to output(warning_message).to_stdout
      end
    end
  end

  describe "#fill_board" do
    context "fill empty place in board" do
      subject(:game){ described_class.new }
      let(:answer_board) { [['_','_', '_'],['_','_', '_'],['_','_', '_']]}
      
      it "write  X in 3 1 cordinate" do
        answer_board[2][0] = 'X'
        game.current_index = 0
        game.current_cord = [3, 1]
        game.send(:fill_board)
        expect(game.board).to eq(answer_board)
      end

      it "write O in 3 1 cordinate" do
        answer_board[2][0] = 'O'
        game.current_index = 1
        game.current_cord = [3, 1]
        game.send(:fill_board)
        expect(game.board).to eq(answer_board)
      end 
    end
  end

  describe "#is_not_integer?" do
    subject(:game){ described_class.new }
    context "checkoing inputs value" do
      it "input value is integer" do
        game.current_cord = ['1', '1']
        expect(game.send(:is_not_integer?)).to be_falsey
      end

      it "input value is not integer" do
        game.current_cord = ['s', '1']
        expect(game.send(:is_not_integer?)).to be_truthy
      end

      it "input value is only one but integer" do
        game.current_cord = ['1']
        expect(game.send(:is_not_integer?)).to be_falsey
      end
    end
  end

  describe "#place_is_already_taken?" do
    subject(:game){ described_class.new }

    context "this place marked" do
      it "1 1 place is not taken" do
        game.current_cord = [1, 1]
        expect(game.send(:place_is_already_taken?)).to be_falsey
      end

      it "1 1 place is taken" do
        game.current_cord = [1, 1]
        game.board = [['X','_', '_'],['_','_', '_'],['_','_', '_']]
        expect(game.send(:place_is_already_taken?)).to be_truthy
      end
    end
  end

  describe "#is_cordinate_out_of_range?" do 
    subject(:game) { described_class.new }

    context "check cordinates" do
      it "3 4 cordinate is out of range" do
        game.current_cord = [3, 4]
        expect(game.send(:is_cordinate_out_of_range?)).to be_truthy
      end

      it "3 3 cordinate is exist" do
        game.current_cord = [3, 3]
        expect(game.send(:is_cordinate_out_of_range?)).to be_falsey
      end
    end
  end

  describe "#check_winner" do
    context "first_player is winner" do
      subject(:game) { described_class.new('ruby', 'java') }

      it "ruby is winner" do
        game.board = [['X','X', 'X'],['_','O', '_'],['_','O', '_']]
        game.current_index = 0
        game.current_cord = [0, 2]
        winner_message = "ruby is winner\n"
        expect { game.send(:check_winner)}.to output(winner_message).to_stdout 
      end

      it "java is winner" do
        game.board = [['X', 'O', 'X'],['X', 'O', '_'],['_','O', '_']]
        game.current_index = 1
        game.current_cord = [0, 1]
        winner_message = "java is winner\n"
        expect { game.send(:check_winner)}.to output(winner_message).to_stdout 
      end
    end
  end
end


