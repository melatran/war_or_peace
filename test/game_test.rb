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
  lets_begin = gets.chomp.upcase

    if lets_begin == 'GO'
      play
    else
      puts "Until next time..."
    end
  end

  def play
    play_count = 0
    move = Turn.new(player1, player2)

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
      p "Turn #{play_count}: WAR - #{winner.name} won 2 cards

    elsif move.type == :mutually_assured_destruction
      move.pile_cards
    end
  end
end
