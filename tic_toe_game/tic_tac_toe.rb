# Tic tac toe is a game where two players place either an X or
# an O on a 3 by 3 board square board.
# The first player to mark the board with their designated
# mark for three in a row wins.

# NOUNS: 3 x 3 square Board, Players, X, O
# VERBS: Mark, Play

# Board
# square
# Player
# - mark
# Engine
# - play
# Top Level Class

require 'pry'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new }
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def board_full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
  # rubocop:disable Metrics/AbcSize
  def draw
    puts ''
    puts'      |      |'
    puts"   #{@squares[1]}  |   #{@squares[2]}  |  #{@squares[3]}"
    puts'      |      |'
    puts' -----+------+-----'
    puts'      |      |'
    puts"   #{@squares[4]}  |   #{@squares[5]}  |  #{@squares[6]}"
    puts'      |      |'
    puts' -----+------+-----'
    puts'      |      |'
    puts"   #{@squares[7]}  |   #{@squares[8]}  |  #{@squares[9]}"
    puts'      |      |'
    puts''
  end
  # rubocop:enable Metrics/AbcSize

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  def find_at_risk_square(ln)
    markers = @squares.values_at(*ln).select(&:marked?).collect(&:marker)
    if markers.size == 2 && markers.min == markers.max
       return @squares.select{ |k, v| ln.include?(k) && v.marker == Square.new.marker}.keys.first
    else
      nil
    end
  end

  def find_two_computer_marks(ln)
    markers = @squares.values_at(*ln).select(&:computer?).collect(&:marker)
    if markers.size == 2 && markers.min == markers.max
       return @squares.select{ |k, v| ln.include?(k) && v.marker == Square.new.marker}.keys.first
    else
      nil
    end
  end

  def five_available?
    return true if @squares[5].marker == ' '
    false
  end

  def def_strat
    WINNING_LINES.each do |line|
     square = find_at_risk_square(line)
     return square if square != nil
    end
    nil
  end

  def off_strat
     WINNING_LINES.each do |line|
     square = find_two_computer_marks(line)
     return square if square != nil
    end
    nil
  end

end

class Square
  INITIAL_MARKER = ' '.freeze
  COMPUTER_MARKER = 'O'.freeze
  attr_accessor :marker
  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def computer?
    marker == COMPUTER_MARKER
  end
end

class Player
  HUMAN_MARKER = 'X'.freeze
  COMPUTER_MARKER = 'O'.freeze
  attr_reader :marker 
  attr_accessor :score, :name
  def initialize(marker)
    @marker = marker
    @score = 0
    set_name
  end

  def set_name
    if human?
      n = nil
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "Sorry, must enter a value."
      end
      self.name = n
    else
      self.name = ['Rocko','Jerry','Bip-Bop','Stooby-wow','Shaco','Lemony_Fresh'].sample
    end
  end

  def human?
    marker == HUMAN_MARKER
  end
end

class TTTGame
  HUMAN_MARKER = 'X'.freeze
  COMPUTER_MARKER = 'O'.freeze

  attr_reader :board, :human, :computer
  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @turn = ''
  end

  def play
    display_welcome_message
    loop do
      clear_screen_and_display_board
      go_first
      loop do
        current_player_moves
        break if board.someone_won? || board.board_full?
        clear_screen_and_display_board
      end
      display_result
      sleep 1
      reset
      next unless play_till_five?
      declare_winner
      break unless play_again?
      full_game_reset
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_board
    puts " #{human.name} is a #{human.marker}. #{computer.name} is a #{computer.marker}"
    puts ''
    board.draw
    puts ''
  end

  def play_till_five?
    return true if human.score == 5 || computer.score == 5
    false
  end

  def declare_winner
    if human.score == 5
     puts  "#{human.name} Wins!"
    else 
     puts "#{computer.name}Wins!"
    end
  end

  def clear_screen_and_display_board
    system 'clear'
    display_board
  end

  def joinor(arr, del, lst = 'or')
    arr[(0..-2)].join(del + ' ') + ' ' +  lst + ' ' +  arr[-1].to_s
  end

  def human_moves
    puts "Chose a square (#{joinor(board.unmarked_keys, ',')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice"
    end

    board[square] = human.marker
  end

  def computer_moves
    if board.five_available? == true
      board[5] = computer.marker
    elsif board.off_strat != nil
      board[board.off_strat] = computer.marker
    elsif board.def_strat != nil
      board[board.def_strat] = computer.marker 
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def display_goodbye_message
    puts 'Thanks for playing!'
    puts ''
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts 'You won this round!'
      human.score += 1
    when computer.marker
      puts "#{computer.name} won this round!"
      computer.score += 1
    else
      puts "This round is a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, must be y or n'
    end

    answer == 'y'
  end

  def go_first
    answer = ''
    loop do
      puts "Who shall go first (player/computer)?"
      answer = gets.chomp
      if answer.start_with?('p')
        @turn = HUMAN_MARKER
        break
      elsif answer.start_with?('c')
        @turn = COMPUTER_MARKER
        break
      end
      puts "Please enter a valid reponse"
      next
    end
  end

  def current_player_moves
    if @turn == HUMAN_MARKER
      human_moves
      @turn = COMPUTER_MARKER
    else
      computer_moves
      @turn = HUMAN_MARKER
    end
  end

  def reset
    board.reset
    clear_screen_and_display_board
    puts ''
    puts "Let's play again!"
  end

  def full_game_reset
    human.score = 0
    computer.score = 0
    board.reset
    @turn = ' '
    clear_screen_and_display_board
    puts ''
    puts "Let's play again!"
  end
end

game = TTTGame.new

game.play
