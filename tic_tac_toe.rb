# sdas
class Board
  attr_accessor :board

  def initialize
    @board = [[" "," "," "],[" "," "," "],[" "," "," "]]
    end

  #Draws the current state of the board
  def draw_board
    puts "\n"
    @board.each {|space| p space}
  end

  #Play the game
  def input_choice(input,position_x, position_y)
    if @board[position_x][position_y] != " "
      p @board[position_x][position_y]
      puts "Can't play here!"
    else @board[position_x][position_y] = input
    end
  end

  def check_victory?(position_x,position_y,player)
    #Check row:
    if @board[position_x][0] == player.choice && @board[position_x][1] == player.choice && @board[position_x][2] == player.choice
      puts player.name + " won!"
      return true
    #check column
    elsif @board[0][position_y] == player.choice && @board[1][position_y] == player.choice && @board[2][position_y] == player.choice
      puts player.name + " won!"
      return true
    #check diagonal
    elsif @board[0][0] == player.choice && @board[1][1] == player.choice && @board[2][2] == player.choice
      puts player.name + " won!"
      return true
      #check reverse diagonal
    elsif @board[0][2] == player.choice && @board[1][1] == player.choice && @board[2][0] == player.choice
      puts player.name + " won!"
      return true
    end

  end
end

class Player < Board
  attr_accessor :name, :choice

  def initialize (name,choice)
    @name = name
    @choice = choice
  end
  def play_game(position_x,position_y,board)
    board.input_choice(@choice,position_x,position_y)
  end

end

a_board = Board.new
player_1 = Player.new("Player 1", "X")
player_2 = Player.new("Player 2", "O")
a_board.draw_board
game_going = true

while game_going
  puts "Player 1, choose a position"
  position_x = gets.chomp.to_i
  position_y = gets.chomp.to_i
  player_1.play_game(position_x,position_y,a_board)
  a_board.draw_board
  if a_board.check_victory?(position_x,position_y, player_1) then break end
  puts "Player 2, choose a position"
  position_x = gets.chomp.to_i
  position_y = gets.chomp.to_i
  player_2.play_game(position_x,position_y,a_board)
  a_board.draw_board
  if a_board.check_victory?(position_x,position_y,player_2) then break end
end