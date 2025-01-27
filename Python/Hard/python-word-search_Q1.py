# Given an m x n grid of characters board and a string word, return True if word exists in the grid.

# For the word to exist, you must be able to construct it from a sequence of cells, where each is adjacent (horizontally or vertically, but not diagonal) to the next one in the sequence. The same cell may not be used twice.

# Input: board = [['F', 'B', 'C', 'D'], ['E', 'M', 'G', 'H'], ['I', 'J', 'U', 'R']] , word = "FEMUR"

# Output: False

# Explanation: Cannot go diagonally from "M" to "U".

def exist(board, word):
  seen = set()
  word = list(word)
  i=0
  j=0
  flag = 0 
  for i in range(0,len(board)):
    for j in range(0,len(board[i])):
      if word[0] == board[i][j]:
        word.pop(0)
        flag = 1
        break
    if flag == 1:
      break
  while len(word) > 0:
    seen.add((i,j))
    if i+1 in range(0,len(board)) and board[i+1][j] == word[0] and (i+1,j) not in seen:
      i = i+1
    elif i-1 in range(0,len(board)) and board[i-1][j] == word[0] and (i-1,j) not in seen:
      i = i-1
    elif j+1 in range(0,len(board[0])) and board[i][j+1] == word[0] and (i,j+1) not in seen:
      j = j+1
    elif j-1 in range(0,len(board[0])) and board[i][j-1] == word[0] and (i,j-1) not in seen:
      j = j-1
    else:
      return False
    word.pop(0)
  return True
