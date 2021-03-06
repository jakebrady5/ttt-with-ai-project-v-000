class TicTacToeCLI

  def initialize
    puts "Welcome to Tic Tac Toe!"
    puts "~~~~~~~~~~~~~~~~~~~~~~~"
    determine_players
  end

  def determine_players
    puts "How many humans will be playing this round? (0-2):"
    humans = gets.to_i
    if humans.between?(0,2)
      if humans == 2
       Game.new.play
      elsif humans == 1
        who_first?
      else
        player1 = Computer.new("X")
        player2 = Computer.new("O")
        game = Game.new(player1, player2)
        game.play
      end
    else
      puts "Invalid entry. Please enter a number between 0 and 2."
      determine_players
    end
  end

  def who_first?
    puts "Who goes first, human or computer?"
    first = gets.strip
    if first == "human"
      player1 = Human.new("X")
      player2 = Computer.new("O")
      game = Game.new(player1, player2)
      game.play
    elsif first == "computer"
      player1 = Computer.new("X")
      player2 = Human.new("O")
      game = Game.new(player1, player2)
      game.play
    else
      puts "Invalid entry. Please type either human or computer."
      who_first?
    end
  end

end