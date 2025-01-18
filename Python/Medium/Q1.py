# # You are given an n x n 2D matrix representing an image, and you need to rotate the image by 90 degrees clockwise. You are basically being asked to implement the functionality of numpy.rot90(matrix, k=-1) (without actually using any helper functions or outside libraries).

def rotate(matrix):
  s = len(matrix)
  for i in range(0,s):
    for j in range(i,s):
      matrix[i][j],matrix[j][i]=matrix[j][i],matrix[i][j]
  for i in range(0,s):
    for j in range(0,s//2):
      matrix[i][j],matrix[i][s-j-1]=matrix[i][s-j-1],matrix[i][j]
    
  return matrix