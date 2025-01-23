# Given an integer array arr, the difference between the largest and smallest values is called amplitude. If you can change up to three elements of the array to any value, return the minimum possible amplitude.

# Examples:
# Example 1:
# Input: arr = [4, -8, -1, 3, 7, 10, 5]

# Output: 4

# Explanation: By changing -8 and -1 to 3, and 10 to 7, the array can be transformed into [4, 3, 3, 3, 7, 7, 5]. The new maximum value is 7 and the new minimum value is 3, resulting in an amplitude of 7 - 3 = 4.

def min_amplitude(arr):
  arr.sort()
  size = len(arr)
  amp=0
  if size > 2:
    for i in range(0,3):
      if (max(arr)-arr[size//2]) >= (arr[size//2]-min(arr)):
        arr[arr.index(max(arr))] = arr[size//2]
      else:
        arr[arr.index(min(arr))] = arr[size//2]
  else:
    arr = [arr[size//2]]*size
  amp = max(arr)-min(arr)
  return amp