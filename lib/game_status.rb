require "pry"

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 4, 8], 
  [2, 4, 6], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8]
  ]
  
def won?(board)
 
  
  WIN_COMBINATIONS.each do |win_combo| 
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]
    
    
    element_1 = board[index_1]
    element_2 = board[index_2]
    element_3 = board[index_3]
    
    if element_1 == "X" && element_2 == "X" && element_3 == "X" || element_1 == "O" && element_2 == "O" && element_3 == "O"
      return win_combo
   end
  end
  board.any? == "X" || board.any? == "O"
end
  
  # binding.pry
  
  
def full?(board)
  board.all? {|element|element == "X" || element == "O"}
  
end

def draw?(board)
!won?(board) && full?(board) 
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def turn_count(board)
  counter = 0 
  board.each do |block|
    if block == "X" || block == "O"
      counter += 1 
   end
end  
 counter
end

  def winner(board)
 won?(board) && turn_count(board) % 2 == 0 
     return "X"
  won?(board) 
    return "O"
    
  draw?(board)
  end
end
  