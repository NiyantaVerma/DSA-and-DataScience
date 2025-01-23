# Given two n x n binary matrices mat and target, return true if it is possible to make mat equal to target by rotating mat in 90-degree increments, or false otherwise.

# Example #1
# Input: mat = [[1,0,1],[0,0,1],[1,0,1]], target = [[1,0,1],[1,0,0],[1,0,1]]

# Output: true

def find_rotation(mat, target):
	size = len(mat)
	# looping through each 90 degree rotations
	for rotations in range(0,3):
		# transpose the matrix first
		for i in range(0,size):
			for j in range(i,size):
				mat[i][j], mat[j][i] = mat[j][i], mat[i][j]
				# then flip the matrix for a 90 degree rotation
		for i in range (0,size):
			for j in range(0,size//2):
				mat[i][j], mat[i][size-j-1] = mat[i][size-j-1], mat[i][j]
				if mat == target:
					return True
	return False