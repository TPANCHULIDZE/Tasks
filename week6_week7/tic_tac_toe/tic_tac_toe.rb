# tic_tac_toe game

CHARS = ['X', 'O'].freeze
SIZE_RANGE = (1..3).freeze
CORD_RANGE = (0..2).to_a.freeze
TWO_CORD = 2
MAX_CORD = 2
MODULE = 2
MATRIX_SIZE = 9
ZERO = 0
DECREASE = Proc.new { |element| element -= 1 }
EMPTY_PLACE = '_'
DRAW = "this is draw"
NOT_ENOUGH_VALUES = "values must not be enough for find winner"
NOT_IN_RANGE_OR_INTEGER = "input values must be in 1..3 range and integer"
NOT_IN_RANGE = "input values must be in 1..3 range"
MARKED_PLACE = "this cordinate is already taken"

class TicTacToe
  attr_reader :board, :cordinates, :current_index, :free_space, :chars, :players

  def initialize(first_player, second_player, cordinates = nil)
    @players = [first_player,second_player]
    @cordinates = cordinates
    @current_index = ZERO
    @current_cord = [ZERO,ZERO]
    @free_space = MATRIX_SIZE
    @winner_person = nil
    @online_game = false
    @board = [
      ['_','_', '_'],
      ['_','_', '_'],
      ['_','_', '_']
    ]
  end

  def call
    if cordinates.nil?
      @online_game = true
    end
    start_game
  end

  private 

  def start_game
    while free_space.positive?
      player_turn
      if @winner_person
        return @winner_person
      end
    end
    if @online_game
      puts DRAW
    else
      DRAW
    end
  end

  def player_turn
    if @online_game
      puts "it's #{players[current_index]} turn"
      @current_cord = gets.chomp().split(' ')
    elsif @cordinates.empty?
      return @winner_person = NOT_ENOUGH_VALUES
    else
      @current_cord = @cordinates.shift
    end

    bool = is_not_integer?

    if bool 
      puts NOT_IN_RANGE_OR_INTEGER
    elsif @current_cord.size != TWO_CORD
      puts "#{players[current_index]} input two index"
    elsif cordinate_out_of_range?
      puts NOT_IN_RANGE
    elsif place_is_already_taken?
      puts MARKED_PLACE
    else
      @current_cord.map!(&DECREASE)
      fill_board
    end
  end

  def fill_board
    board[@current_cord.first][@current_cord.last] = CHARS[current_index]
    @free_space -= 1
    board.each { |element| p element }
    check_winner
    @current_index = @current_index.next % MODULE
  end

  def is_not_integer?
    return true unless (@current_cord.is_a? Array)

    if @current_cord.all? { |element| element.respond_to?(:to_i) }
      @current_cord.map!(&:to_i)
      @current_cord.any? { |element| element.to_i.to_s != element.to_s }
    else
      true
    end
  end

  def place_is_already_taken?
    cord = @current_cord.map(&DECREASE)
    board[cord.first][cord.last] != EMPTY_PLACE
  end

  def cordinate_out_of_range?
     is_first_cordinate_bad? || is_second_cordiate_bad?
  end

  def is_first_cordinate_bad?
    !SIZE_RANGE.include? @current_cord.first
  end

  def is_second_cordiate_bad?
    !SIZE_RANGE.include? @current_cord.last
  end

  def check_row
    board[@current_cord.first].all? {|element| element == CHARS[current_index]}
  end

  def check_column
    board.transpose[@current_cord.last].all? { |element| element == CHARS[current_index] }
  end

  def left_diagonal
    CORD_RANGE.all? { |index| board[index][index] == CHARS[current_index] }
  end

  def right_diagonal
    CORD_RANGE.all? { |index| board[index][MAX_CORD - index] == CHARS[current_index] }
  end

  def check_winner
    if check_row || check_column 
      winner
    elsif left_diagonal || right_diagonal
      winner
    else
      #nothing
    end
  end

  def winner
    if @online_game
      puts "#{players[current_index]} is winner"
      exit 1
    else
      @winner_person = players[current_index]
    end
  end
end 

# puts "input first player name"
# first_player = gets.chomp
# puts "input second player name"
# second_player = gets.chomp

# array = [[1,2],[1,1],[2,2],[3,3],[3,2]]

# puts TicTacToe.new(first_player, second_player).call


