# Roman numerals are formed by converting decimal place values from highest to lowest. When converting an integer to a Roman numeral, follow these rules:

# For numbers that don’t start with 4 or 9: Pick the symbol with the largest value that can be subtracted from the number. Append that symbol to the result, subtract its value, and repeat the process with the remaining number.

# For numbers that start with 4 or 9: Use a subtractive form. This means you write one smaller symbol before a larger one. For example:

# 4 is written as "IV" (1 less than 5),
# 9 is written as "IX" (1 less than 10),
# 40 is written as "XL" (10 less than 50),
# 90 is written as "XC" (10 less than 100),
# 400 is written as "CD" (100 less than 500),
# 900 is written as "CM" (100 less than 1000).
# Symbols can be repeated up to three times for powers of 10: Only the symbols for 1 (I), 10 (X), 100 (C), and 1000 (M) can be repeated consecutively, up to three times, to represent multiples of those values. Symbols like 5 (V), 50 (L), and 500 (D) cannot be repeated. If you need to append a symbol four times, use the subtractive form instead (like "IV" for 4).

def intToRoman(num):
  roman = ['M','D','C','L','X','V','I']
  number = [1000,500,100,50,10,5,1]
  ans = ''
  for i in range(0,len(number)):
    x = num//number[i]
    if x == 4:
      if ans[-1] in ('D','L','V'):
        ans=ans[:-1]
        ans+=roman[i]
        ans+=roman[i-2]
      else:
        ans+=roman[i]
        ans+=roman[i-1]
    elif x == 0:
      num=num%number[i]
      continue
    else:
      ans+=x*roman[i]
    num=num%number[i]
  return ans
  