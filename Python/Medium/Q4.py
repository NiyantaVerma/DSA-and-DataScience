# Given a list of integers, return the maximum product of any three numbers in the array.

# For example, for A = [1, 3, 4, 5], you should return 60, since 
# 3∗4∗5=60.

# For B = [−4, −2, 3, 5] you should return 40 since 
# −4∗−2∗5=40

def max_three(input):
  input.sort()
  max_pro1 = input[-1]*input[-2]*input[-3]
  max_pro2 = 1
  if input[0] < 0 and input[1] < 0:
    max_pro2 = input[0]*input[1]*input[-1]
  if max_pro1 < max_pro2:
    return max_pro2
  else:
    return max_pro1