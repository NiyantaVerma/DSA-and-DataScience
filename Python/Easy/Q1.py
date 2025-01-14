# Given a number n
# n, write a formula that returns n!

# In case you forgot the factorial formula, n!=n∗(n−1)∗(n−2)∗.....2∗1
# n!=n∗(n−1)∗(n−2)∗.....2∗1.

# For example, 5!=5∗4∗3∗2∗1=120
# 5!=5∗4∗3∗2∗1=120 so we'd return 120.

# Assume n is a non-negative integer.

def factorial(n):
  answer = 1
  for i in range(1, n+1):
      answer = answer * i
  return answer