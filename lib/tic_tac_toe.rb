class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]
   
   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    if @board.count("X") > @board.count("O")
      "O"
    else
      "X"
    end
  end
  
  def turn
    puts "Please enter a move 1-9:"
    input = gets.chomp
    index = input_to_index(index)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else 
      turn
    end
    display_board
  end
end