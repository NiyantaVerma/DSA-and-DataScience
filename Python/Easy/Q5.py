# You are given an integer array nums, where each element in it is a single digit (0-9).

# The triangular sum of nums is the value of the only element present in nums after the following process terminates:

# Let nums comprise of n elements. If n == 1, end the process. Otherwise, create a new integer array newNums of length n - 1.
# For each index i, assign the value of newNums[i] as (nums[i] + nums[i+1]) % 10, where % denotes the modulo operator.
# Replace the array nums with newNums.
# Repeat the entire process starting from step 1.
# Return the triangular sum of nums.

def triangular_sum(nums):
    # Base case: When there's only one number left
    if len(nums) == 1:
        return nums[0]
    
    # Recursive case: Combine adjacent numbers and make the recursive call
    next_nums = []
    for i in range(1, len(nums)):
        next_nums.append((nums[i-1] + nums[i]) % 10)
    
    return triangular_sum(next_nums)
