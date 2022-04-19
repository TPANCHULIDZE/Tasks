# tic_tac_toe game

SIZE_RANGE = (1..3).freeze
CORD_RANGE = (0..2).to_a.freeze
TWO_CORD = 2
MAX_CORD = 2
MOD = 2
DECREASE = Proc.new { |element| element -= 1 }

class Tic_Tac_Toe
  attr_reader :board, :cordinates, :current_index, :free_space, :chars, :players

  def initialize(first_player, second_player, cordinates = [])
    @players = [first_player,second_player]
    @cordinates = cordinates
    @current_index = 0
    @free_space = 9
    @winner_person = nil
    @boolean = false
    @chars = ['X', 'O']
    @board = [
      ['_','_', '_'],
      ['_','_', '_'],
      ['_','_', '_']
    ]
  end

  def call
    if cordinates.empty?
      @boolean = true
    end
    start_game
  end

  private 

  def start_game
    while free_space > 0
      player_turn
      if @winner_person
        return @winner_person
      end
    end
  end

  def player_turn
    if @boolean
      puts "it's #{players[current_index]} turn"
      cord = gets.chomp().split(' ')
    elsif @cordinates.empty?
      return @winner_person = "values must not be enough for find winner"
    else
      cord = @cordinates.shift
    end
    puts cord
    bool = is_not_integer?(cord)
    cord.map!(&:to_i)

    if bool 
      puts "input values must be in 1..3 range and integer"
    elsif cord.size != TWO_CORD
      puts "#{players[current_index]} input two index"
    elsif cordinate_out_of_range?(cord)
      puts "input values must be in 1..3 range"
    elsif place_is_already_taken?(cord.map(&DECREASE))
      puts "this cordinate is already taken"
    else
      fill_board(cord.map(&DECREASE))
    end
  end

  def fill_board(cord)
    board[cord.first][cord.last] = chars[current_index]
    @free_space -= 1
    board.each { |element| p element }
    check_winner(cord)
    @current_index = @current_index.next % MOD
  end

  def is_not_integer?(cord)
    cord.any? { |element| element.to_i.to_s != element.to_s }
  end

  def place_is_already_taken?(cord)
    board[cord.first][cord.last] != '_'
  end

  def cordinate_out_of_range?(cord)
    (!SIZE_RANGE.include? cord.first) || (!SIZE_RANGE.include? cord.last)
  end

  def check_row(index)
    board[index].all? {|element| element == chars[current_index]}
  end

  def check_column(index)
    board.transpose[index].all? { |element| element == chars[current_index] }
  end

  def left_diagonal
    CORD_RANGE.all? { |index| board[index][index] == chars[current_index] }
  end

  def right_diagonal
    CORD_RANGE.all? { |index| board[index][MAX_CORD - index] == chars[current_index] }
  end

  def check_winner(cord)
    if check_row(cord.first) || check_column(cord.last) 
      winner
    elsif left_diagonal || right_diagonal
      winner
    else
      #nothing
    end
  end

  def winner
    if @boolean
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

# #array = [[1,2],[1,1],[2,2],[3,3],[3,2]]
# array = []
# puts Tic_Tac_Toe.new(first_player, second_player,array).call


