# Given an integer array, find the sum of the largest contiguous subarray within the array.

# For example, if the input is [−1, −3, 5, −4, 3, −6, 9, 2], then return 11 (because of [9, 2]).

# Note that if all the elements are negative, you should return 0.

def max_subarray_sum(input):
  n = len(input)
  max_sum = 0
  curr_sum = 0
  for i in range(n):
    curr_sum += input[i]
    max_sum = max(max_sum, curr_sum)
    if curr_sum < 0:
      curr_sum = 0
  return max_sum