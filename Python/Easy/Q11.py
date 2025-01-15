# You are given a strictly increasing array of integers nums, and a positive integer diff. An arithmetic triplet with a gap of diff is defined as triplet of integers (a,b,c) from nums where:

# Each value is unique, and the triplet is in increasing order:
# a < b < c
# The difference in the values from a->b and b->c are both exactly the specified value diff
# b - a = diff
# c - b = diff
# Return the number of arithmetic triplets with a gap of diff that exist in nums.

def arithmeticTriplets(nums: list[int], diff: int) -> int:
  ans = 0
  for i in range(0,len(nums)):
    b = nums[i] + diff
    c = 2*diff + nums[i]
    if c in nums and b in nums:
      ans+=1
  return ans