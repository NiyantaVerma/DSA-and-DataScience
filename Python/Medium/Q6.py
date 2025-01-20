# You are given an integer array nums consisting of n elements, and an integer k.

# Your task is to find a contiguous subarray of nums whose length is exactly k that has the highest average value. A subarray is simply a sequence of consecutive elements from the original array. After identifying this subarray, return the average value, rounded to two decimal places.

def max_avg_subarray(nums, k):
  max_sum = float('-inf')
  for i in range(0,len(nums),k):
    current_sum = 0
    for j in range(i,i+k):
      current_sum += nums[j]
    current_sum = round(current_sum / k, 2)
    max_sum = max(max_sum,current_sum)
  return max_sum