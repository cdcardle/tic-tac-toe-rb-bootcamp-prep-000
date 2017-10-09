
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, position, token)
  board[position] = token
end

def position_taken?(board, position)
  board[position] != " "
end

def valid_move?(board, position)
  if (position < 0 || position > 8)
    false
  elsif position_taken?(board, position)
    false
  else true
  end
end

def turn(board)
  puts "Please enter a number from 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, token="X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = (board.select{|i| i != "O"}).length
  return count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end
