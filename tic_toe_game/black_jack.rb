# Twenty-One is a card game that consists of a player and a dealer.
# Both participants must draw cards from a deck and attempt to get as close to the value of 21 without going over.
# Both players are initially provided with two cards each drawn from a deck of 52 cards. 
# - The player takes the first turn and can choose to "hit" or "stay"
# - If the player "busts", they loose.
# - If the player "stays", it is then the dealers turn
# - The dealer must "hit" their cards until the value adds up to at least 17
# - If the dealer "busts", the player wins.
# - If both player and dealer stay, the player with the highest score wins.
# - If totals are equal, then it is a tie. (No one wins)
# Noun: Player, Dealer, Card, Deck, Game, Total(score),
# Verb: deal, hit, stay, bust

class Deck
  # holds 52 unique cards (hash data type?)
  attr_accessor :deck
  def initialize
    @deck = [['Two of Spades', '2'], ['Two of Hearts', '2'], ['Two of Clubs', '2'], ['Two of Diamonds', '2']] +
    [['Three of Spades', '3'], ['Three of Hearts', '3'], ['Three of Clubs', '3'], ['Three of Diamonds', '3']] +
        [['Four of Spades', '4'], ['Four of Hearts', '4'], ['Four of Clubs', '4'], ['Four of Diamonds', '4']] +
        [['Five of Spades', '5'], ['Five of Hearts', '5'], ['Five of Clubs', '5'], ['Five of Diamonds', '5']] +
            [['Six of Spades', '6'], ['Six of Hearts', '6'], ['Six of Clubs', '6'], ['Six of Diamonds', '6']] +
    [['Seven of Spades', '7'], ['Seven of Hearts', '7'], ['Seven of Clubs', '7'], ['Seven of Diamonds', '7']] +
    [['Eight of Spades', '8'], ['Eight of Hearts', '8'], ['Eight of Clubs', '8'], ['Eight of Diamonds', '8']] +
        [['Nine of Spades', '9'], ['Nine of Hearts', '9'], ['Nine of Clubs', '9'], ['Nine of Diamonds', '9']] +
        [['Ten of Spades', '10'], ['Ten of Hearts', '10'], ['Ten of Clubs', '10'], ['Ten of Diamonds', '10']] +
    [['Jack of Spades', '10'], ['Jack of Hearts', '10'], ['Jack of Clubs', '10'], ['Jack of Diamonds', '10']] +
[['Queen of Spades', '10'], ['Queen of Hearts', '10'], ['Queen of Clubs', '10'], ['Queen of Diamonds', '10']] +
    [['King of Spades', '10'], ['King of Hearts', '10'], ['King of Clubs', '10'], ['King of Diamonds', '10']] +
      [['Ace of Spades', '11'], ['Ace of Hearts', '11'], ['Ace of Clubs', '11'], ['Ace of Diamonds', '11']]
  end

  def deal
    item = @deck.sample
    deck.delete(item)
    item
  end
end

class Player
  attr_accessor :hand
  def initialize
    @hand = []
  end

  def hit(deck)
    draw = deck.deal
    if draw[1] == '11' && hand.empty? == false && draw[1].to_i + hand.reduce(:+) > 21
      puts "Player drew #{draw[0]}"
      return hand << 1
    else
      puts "Player drew #{draw[0]}"
      hand << draw[1].to_i
    end
  end

  def stay
    puts 'Stay'
  end

  def busted?
    return true if hand.reduce(:+) > 21
    false
  end

  def total
    hand.reduce(:+)
  end
end

class Dealer
  attr_accessor :hand
  def initialize
    @hand = []
  end

  def hit(deck)
    draw = deck.deal
    if draw[1] == '11' && hand.empty? == false && draw[1].to_i + hand.reduce(:+) > 21
      puts "Dealer drew a card"
      return hand << 1
    else
      puts "Dealer drew a card"
      hand << draw[1].to_i
    end
  end

  def initial_draw(deck)
    draw = deck.deal
    if draw[1] == '11' && hand.empty? == false && draw[1].to_i + hand.reduce(:+) > 21
      puts "Dealer drew #{draw[0]}"
      return hand << 1
    else
      puts "Dealer drew #{draw[0]}"
      hand << draw[1].to_i
    end
  end

  def stay
    puts 'Stay'
  end

  def busted?
    return true if hand.reduce(:+) > 21
    false
  end

  def total
    hand.reduce(:+)
  end
end

class TwentyOneEngine
  attr_accessor :player, :dealer, :deck
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def initial_draw
    sleep 2
    puts 'For the initial draw, player and dealer draw two cards each'
    sleep 2
    player.hit(deck)
    player.hit(deck)
    puts ''
    puts "Player's initial total is #{player.total}"
    puts''
    puts 'Now dealer will draw'
    sleep 2
    dealer.initial_draw(deck)
    dealer.hit(deck)
    puts ''
  end

  def display_welcome_message
    puts 'Welcome to Twenty-One!'
  end

  def display_end_game
    puts 'Thanks for playing!'
  end

  def player_turn
    loop do
      puts 'Choose (h)it or (s)tay!'
      answer = gets.chomp
      if answer == 'h'
        player.hit(deck)
        puts "Player's total is #{player.total}"
      elsif answer == 's'
        puts "Player decided to stay at #{player.total}"
        sleep 2
        break
      else
        puts 'Please enter a valid choice'
        puts ''
      end
    end
    return 'busted' if player.busted?
    player.total
  end

  def computer_turn
    loop do
      sleep 2
      dealer.hit(deck)
      puts 'Dealer draws a card'
      break if dealer.total >= 17
    end
    return 'busted' if dealer.busted?
    dealer.total
  end

  def determine_winner
    return 'Player has busted so Dealer' if player.busted?
    return 'Dealer has busted so Player' if dealer.busted?

    return 'Player' if player.total > dealer.total
    return 'Dealer' if dealer.total > player.total
    "It's a tie! No player"
  end

  def display_winner
    puts "Player total is #{player.total} and Dealer total is #{dealer.total}"
    puts "#{determine_winner} has won the game!"
    sleep 3
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, must be y or n.'
    end

    answer == 'y'
  end

  def reset
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def play
    display_welcome_message
    loop do
      initial_draw
      loop do
        player_turn
        break if player.busted?
        computer_turn
        break if dealer.busted?
        break
      end
      determine_winner
      display_winner
      play_again? ? reset : break
    end
    display_end_game
  end
end

TwentyOneEngine.new.play
