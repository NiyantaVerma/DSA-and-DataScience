# You are given an m x n matrix. Your task is to determine if the matrix has diagonal stripes where all elements in each diagonal from top-left to bottom-right are of the same stripe—that is, they are identical.

# In this context, each diagonal stripe runs from the top-left corner to the bottom-right corner of the matrix. Check if every diagonal stripe consists entirely of the same number.

# Return True if all diagonal stripes are of the same stripe, otherwise return False.

def is_same_stripes(matrix):
  for i in range(0,len(matrix)):
    for j in range(0,len(matrix[0])):
      if (i+1 < len(matrix)) and (j+1 < len(matrix)):
        if matrix[i][j] == matrix[i+1][j+1]:
          flag = 1
          continue
        else:
          flag = 0
          return False
  return True