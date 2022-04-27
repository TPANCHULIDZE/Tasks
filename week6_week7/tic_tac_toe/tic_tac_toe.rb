# tic_tac_toe game

CHARS = ['X', 'O'].freeze
SIZE_RANGE = (1..3).freeze
CORD_RANGE = (0..2).to_a.freeze
TWO_CORDINATES = 2
MAX_CORD = 2
MODULE = 2
MATRIX_SIZE = 9
ZERO = 0
DECREASE = Proc.new { |element| element -= 1 }
EMPTY_PLACE = '_'
DRAW = "this is draw"
NOT_ENOUGH_VALUES = "values must not be enough for find winner"
NOT_IN_RANGE_OR_NOT_INTEGER = "input values must be in 1..3 range and integer"
NOT_IN_RANGE = "input values must be in 1..3 range"
MARKED_PLACE = "this cordinate is already taken"

class TicTacToe
  attr_accessor :board, :current_index, :free_space, :players, :current_cord

  def initialize(first_player = 'first', second_player = 'second')
    @players = [first_player,second_player]
    @current_index = ZERO
    @current_cord = [ZERO,ZERO]
    @free_space = MATRIX_SIZE
    @winner_person = nil
    @board = [
      ['_','_', '_'],
      ['_','_', '_'],
      ['_','_', '_']
    ]
  end

  def start_game
    show_board

    while free_space.positive?
      exit 1 if @winner_person
      player_input_cordinates
    end

    puts DRAW
  end

  def player_input_cordinates
    puts "it's #{players[current_index]} turn"
    @current_cord = gets.chomp().split(' ')
    player_turn
  end

  def player_turn
    bool = is_not_integer?
    @current_cord.map!(&:to_i)

    if bool 
      puts NOT_IN_RANGE_OR_NOT_INTEGER
    elsif @current_cord.size != TWO_CORDINATES
      puts "#{players[current_index]} input two index"
    elsif is_cordinate_out_of_range?
      puts NOT_IN_RANGE
    elsif place_is_already_taken?
      puts MARKED_PLACE
    else
      fill_board
    end
  end

  private

  def fill_board
    @current_cord.map!(&DECREASE)
    board[@current_cord.first][@current_cord.last] = CHARS[current_index]
    show_board
    check_winner
  end

  def is_not_integer?
    @current_cord.any? { |element| element.to_i.to_s != element.to_s }
  end

  def place_is_already_taken?
    cord = @current_cord.map(&DECREASE)
    board[cord.first][cord.last] != EMPTY_PLACE
  end

  def is_cordinate_out_of_range?
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
      @free_space -= 1
      @current_index = @current_index.next % MODULE
    end
  end

  def show_board
    board.each { |element| p element }
  end

  def winner
    @winner_person = players[current_index]
    puts "#{@winner_person} is winner"
  end
end 

# puts "input first player name"
# first_player = gets.chomp
# puts "input second player name"
# second_player = gets.chomp

# puts TicTacToe.new(first_player, second_player).start_game


