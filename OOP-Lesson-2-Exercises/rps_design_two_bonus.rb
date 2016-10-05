require 'pry'

class Player
  attr_accessor :move, :name
  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, or spock."
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = choice
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Rock
  attr_accessor :item
  def initialize
    self.item = 'rock'
  end
end

class Paper
  def initialize
    item
  end

  def item
    'paper'
  end
end

class Scissors
  def initialize
    item
  end

  def item
    'scissors'
  end
end

class Spock
  def initialize
    item
  end

  def item 
    'spock'
  end
end

class Lizard
  def initialize
    item
  end

  def item 
    'lizard'
  end
end

class Move
  attr_accessor :rock, :paper, :scissors, :spock, :lizard
  VALUES = ['rock', 'scissors', 'paper', 'spock', 'lizard'].freeze

  def initialize
    @rock = 'rock'
    @paper = 'paper'
    @scissors = 'scissors'
    @lizard = 'lizard'
    @spock = 'spock'
  end

  def human_win?(human, comp)
   return 'human' if human == @paper && (comp == @rock || comp == @spock)
   return 'human' if human == @spock && (comp == @scissors || comp == @rock)
   return 'human' if human == @lizard && (comp == @paper || comp == @spock)
   return 'human' if human == @rock && (comp == @scissors || comp == @lizard)
   return 'human' if human == @scissors && (comp == @lizard || comp == @paper)
   return 'tie'   if human == comp
   return 'computer' 
  end

  def to_s
    @value
  end
end

class RPSGame
  attr_accessor :human, :computer, :human_score, :computer_score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @human_score = 0
    @computer_score = 0
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock"
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def display_moves
    puts "#{human.name} choose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human_win?(human.move, computer.move) == 'human'
      puts "#{human.name} win!"
    elsif human_win?(human.move, computer.move) == 'computer'
      puts "#{computer.name} win!"
    elsif human_win?(human.move, computer.move) == 'tie'
      puts "It's a tie!"
    end
  end

  def display_score
    # Display the score between human and computer. 
    puts "#{human.name}'s score is #{human_score}"
    puts "#{computer.name}'s score is #{computer_score}"
    # Determine when player or computer reaches score 10. 
  end

  def reset_score
    @human_score = 0
    @computer_score = 0
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n."
    end

    return true if answer == 'y'
    false
  end

  def is_winner?
    if @human_score == 2
      puts "#{human.name} wins!"
      return true
    elsif @computer_score == 2
      puts "#{computer.name} wins!"
      return true
    else
      puts "We have no winner yet!"
      return false
    end
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
      if is_winner?
       reset_score
       break unless play_again? 
      end
    end
    display_goodbye_message
  end
end

RPSGame.new.play
