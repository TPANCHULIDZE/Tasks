# tester for tic_tac_toe game

require '../tic_tac_toe'
require 'rspec/autorun'

describe TicTacToe do
  context "player can win" do
    it "first player win" do
      first_player = "ruby"
      second_player = "java"
      input = [[1,2],[1,1],[2,2],[3,3],[3,2]]
      winner = TicTacToe.new(first_player,second_player,input).call
      expect(winner).to eq first_player
    end

    it "first player win when first row is X X X" do
      first_player = "ruby"
      second_player = "html"
      input = [[1,1],[2,2],[3,1],[2,1],[1,3],[3,3],[1,2],[2,3]]
      winner = TicTacToe.new(first_player,second_player,input).call
      expect(winner).to eq first_player
    end

    it "first row is X X X but also input more unneccesery information" do
      first_player = "ruby"
      second_player = "html"
      input = [[1,1],[2,2],[3,1],[2,1],[1,3],[1,3],[4,4],[2,2],[3,3],[1,2],[2,3]]
      winner = TicTacToe.new(first_player,second_player,input).call
      expect(winner).to eq first_player
    end

    it "second player win" do
      first_player = "css"
      second_player = "ruby"
      input = [[1,2],[1,1],[2,1],[1,3],[2,3],[2,2],[3,2],[3,1],[3,3]]
      winner = TicTacToe.new(first_player,second_player,input).call
      expect(winner).to eq second_player
    end

    it "second player win X X X type" do
      first_player = "css"
      second_player = "ruby"
      input = [[2,2],[1,1],[3,3],[1,2],[3,1],[1,3],[2,3],[2,1]]
      winner = TicTacToe.new(first_player,second_player,input).call
      expect(winner).to eq second_player
    end
  end

  context "no winner" do
    it "match is draw" do
      first_player = "c++"
      second_player = "ruby"
      input = [[1,1],[2,2],[3,3],[1,2],[1,3],[3,1],[3,2],[2,3],[2,1]]
      winner = TicTacToe.new(first_player,second_player,input).call
      expect(winner).to eq DRAW
    end

    it "not enough values" do
      first_player = "c++"
      second_player = "ruby"
      input = [[1,1],[2,2],[3,3],[4,4]]
      winner = TicTacToe.new(first_player,second_player,input).call
      expect(winner).to eq NOT_ENOUGH_VALUES
    end

    it "no cordinates" do
      first_player = "javascript"
      second_player = "ruby"
      input = []
      winner = TicTacToe.new(first_player,second_player,input).call
      expect(winner).to eq NOT_ENOUGH_VALUES
    end

    it "one cordinates" do
      first_player = "javascript"
      second_player = "ruby"
      input = [[1,2]]
      winner = TicTacToe.new(first_player,second_player,input).call
      expect(winner).to eq NOT_ENOUGH_VALUES
    end

    it "input cordinate is not validate" do
      first_player = "javascript"
      second_player = "ruby"
      input = ["kjan",['shbj',1], ['cbja', 'hjbbd'], [1, 'ss'],[1,1], ['dsd',[1]]]
      winner = TicTacToe.new(first_player,second_player,input).call
      expect(winner).to eq NOT_ENOUGH_VALUES
    end
  end
end


