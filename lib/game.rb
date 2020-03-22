class Game
  attr_reader :player1, :player2

  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
    p "---------------------------------------------------------------------"
    user = gets.chomp.upcase

    if user == 'GO'
      play
    else
      puts "Off with your head for not reading the rules.."
    end
  end

  def play
    play_count = 0
    move = Turn.new(player1, player2)

    until player1.has_lost? || player2.has_lost?
      if move.type == :basic
        winner = move.winner
        move.pile_cards
        move.award_spoils(winner)
        play_count += 1
        p "Turn #{play_count}: #{winner.name} won 2 cards"

      elsif move.type == :war
        winner = move.winner
        move.pile_cards
        move.award_spoils(winner)
        play_count += 1
        p "Turn #{play_count}: WAR - #{winner.name} won 6 cards"

      elsif move.type == :mutually_assured_destruction
        move.pile_cards
        play_count += 1
        p "Turn #{play_count}: *mutually assured destruction* 6 cards removed from play"
      end

      break if play_count == 1000000
    end

    if player1.has_lost? == true
      p "*~*~*~*#{player2.name} has won the game!*~*~*~*"
    elsif player2.has_lost? ==true
      p "*~*~*~*#{player1.name} has won the game!*~*~*~*"
    else
      p "---- DRAW ----"
    end
  end
end
