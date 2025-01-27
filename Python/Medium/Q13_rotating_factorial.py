# let's define a rotating factorial: instead of multiplying out all the numbers, we rotate between arithmetic operators like multiplication (*), floor division (//), addition (+), and subtraction (-).

# For example, rotating_factorial(10)=10∗9//8+7−6∗5//4+3−2∗1

# When computing the above equation remember to apply PEMDAS (the order of operations) where multiplication and floor division come before addition/subtraction.

# p.s. floor division is a type of division operation that returns the largest integer less than or equal to the result of dividing two numbers (aka we chop off the remainder and return a whole integer).

def rotating_factorial(n):
  stack = []
  stack.append(n)
  n -= 1
  operations = 0
  while n > 0:
    if operations == 0:
      stack.append(stack.pop()*n)
    elif operations == 1:
      stack.append(int(stack.pop()/n))
    elif operations == 2:
      stack.append(n)
    else:
      stack.append(-n)
      
    n -= 1
    operations = (operations+1)%4
  return sum(stack)