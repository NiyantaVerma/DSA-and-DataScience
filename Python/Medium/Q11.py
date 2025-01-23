# You're attempting to climb a hill—not in a mathematical optimization sense (check out hill climbing for that), but literally outside, touching grass, and trying to climb a hill.

# Imagine there are n steps carved into the hill. You can go up using either 1 or 2 steps at a time.

# Your task is to return the number of distinct ways to reach the top of the hill.

# Example 1:
# Input: 3
# Output: 3
# Explanation: There are three distinct ways to climb to the top of a hill with 3 steps:

# Take 1 step, then 1 step, then 1 step.
# Take 1 step, then 2 steps.
# Take 2 steps, then 1 step.

def climb_hill(n):
  def permutation(m,r):
    pro=1
    div_1=1
    div_2=1
    for x in range(m,1,-1):
      pro*=x
    for y in range(1,r+1):
      div_1*=y
    for z in range(m-r,1,-1):
      div_2*=z
    perm = pro/(div_1*div_2)
    return perm
  ans = 0
  for i in range(0,n//2+1):
    r = i
    m = n-i
    ans += permutation(m,r)
  return ans