
class Player
  attr_accessor :move, :name, :history, :list
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
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose(history, turns)    
    case self.name
    when 'R2D2'
      self.move = [Move.new('spock'),Move.new('rock'),Move.new('rock')].sample 
    when 'Hal'
      turns = turns.to_f
      rock = (history.human_rock_count / turns)
      paper = (history.human_paper_count /  turns)
      scissors = (history.human_scissors_count / turns)
      spock = (history.human_spock_count / turns)
      lizard = (history.human_lizard_count / turns)
      return self.move = [Move.new('paper'), Move.new('spock'), Move.new('rock')].sample if rock > 0.60
      return self.move = [Move.new('lizard'),Move.new('scissors'),Move.new('paper')].sample if paper > 0.60
      return self.move = [Move.new('spock'), Move.new('rock'), Move.new('scissors')].sample if scissors > 0.60
      return self.move = [Move.new('paper'), Move.new('lizard'), Move.new('spock')].sample if spock > 0.60
      return self.move = [Move.new('rock'), Move.new('scissors'),Move.new('lizard')].sample if lizard > 0.60
    self.move = Move.new(Move::VALUES.sample)
    when 'Chappie'
      self.move = [Move.new('lizard'),Move.new('scissors'),Move.new('lizard')].sample 
    when 'Sonny'
      self.move = [Move.new('lizard'),Move.new('scissors'),Move.new('paper'),Move.new('spock')].sample 
    when 'Number 5'
      self.move = [Move.new('paper'),Move.new('paper'),Move.new('paper')].sample 
    end
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard'].freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
  end

  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?))||
      (spock? && (other_move.scissors? || other_move.rock?)) ||
      (lizard? && (other_move.spock? || other_move.paper?))
  end

  def <(other_move)
    (rock? && (other_move.paper? || other_move.spock?)) ||
      (paper? && (other_move.scissors? || other_move.lizard?)) ||
      (scissors? && (other_move.rock? || other_move.spock?)) ||
      (spock? && (other_move.lizard? || other_move.paper?)) ||
      (lizard? && (other_move.scissors? || other_move.rock?))
  end

  def to_s
    @value
  end
end

class History
  attr_accessor :list
  def initialize
    @list = {human_rock: 0, human_paper: 0, human_scissors: 0, human_spock: 0, human_lizard: 0,
      computer_rock: 0, computer_paper: 0, computer_scissors: 0, computer_spock: 0, computer_lizard: 0}
  end

  def update_human(choice)
    choice = choice.to_s
    return @list[:human_rock] += 1 if choice == 'rock'
    return @list[:human_paper] += 1 if choice == 'paper'
    return @list[:human_scissors] += 1 if choice == 'scissors'
    return @list[:human_spock] += 1 if choice == 'spock'
    return @list[:human_lizard] += 1 if choice == 'lizard'
    false
  end

  def update_computer(choice)
    choice = choice.to_s
    return @list[:computer_rock] += 1 if choice == 'rock'
    return @list[:computer_paper] += 1 if choice == 'paper'
    return @list[:computer_scissors] += 1 if choice == 'scissors'
    return @list[:computer_spock] += 1 if choice == 'spock'
    return @list[:computer_lizard] += 1 if choice == 'lizard'
    false
  end

  def display_history
    puts @list
  end

  def human_rock_count
    @list[:human_rock].to_f
  end
  def human_paper_count
    @list[:human_paper].to_f
  end
  def human_scissors_count
    @list[:human_scissors].to_f
  end
  def human_spock_count
    @list[:human_spock].to_f
  end
  def human_lizard_count
    @list[:human_lizard].to_f
  end
end

class RPSGame
  attr_accessor :human, :computer, :human_score, :computer_score, :history, :turns

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new
    @human_score = 0
    @computer_score = 0
    @turns = 1
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

  def increase_turn
    @turns = turns + 1
  end

  def display_winner
    if human.move > computer.move # if human_choice
      puts "#{human.name} chose #{human.move} so #{human.name} wins!"
      history.update_human(human.move.to_s ) 
      history.update_computer(computer.move.to_s)
      @human_score += 1
    elsif human.move < computer.move
      puts "#{computer.name} chose #{computer.move} so #{computer.name} wins!"
      history.update_human(human.move.to_s ) 
      history.update_computer(computer.move.to_s)
      @computer_score += 1
    else
      puts "It's a tie!"
      history.update_human(human.move.to_s ) 
      history.update_computer(computer.move.to_s)
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
    if @human_score == 10
      puts "#{human.name} wins!"
      return true
    elsif @computer_score == 10
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
      computer.choose(history, turns)
      display_moves
      display_winner
      display_score
      increase_turn
      if is_winner?
       reset_score
       break unless play_again? 
      end
    end
    display_goodbye_message
  end
end

RPSGame.new.play
