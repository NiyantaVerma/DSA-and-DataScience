# Given an integer numRows, return the first numRows of Pascal's triangle.

# In Pascal's triangle, each number is the sum of the two numbers directly above it

# 1
# 1  1
# 1  2  1
# 1  3  3  1
# 1  4  6  4  1

def generate(numRows):
  triangle = []
  for row_num in range(numRows):
    # Start each row with 1s
    row = [1] * (row_num + 1)
    # Fill the middle values
    for j in range(1, row_num):
      row[j] = triangle[row_num - 1][j - 1] + triangle[row_num - 1][j]
    # Add the row to the triangle
    triangle.append(row)
  return triangle