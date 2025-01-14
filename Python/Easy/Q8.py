# Given an integer num, return its string representation in base 13.

# In case you don’t use base 13 that much (who does, right?), here’s a quick rundown: just like base 10 uses digits from 0 to 9. But also for 10, 11 and 12, we use the letters A, B, and C.

# 9 in base 13 is "3A" (since 3∗13+10=49)
# 69 in base 13 is "54" (since 5∗13+4=69)

def convertToBase13(num):
    if num == 0:
        return "0"
    
    base13_digits = "0123456789ABC"
    digits_arr = []
    positive = abs(num)
    
    while positive > 0:
        # Append to list
        digits_arr.append(base13_digits[positive % 13])  
        positive = positive // 13
    
    reversed_digits = digits_arr[::-1]
    # Join list into a string
    result = ''.join(reversed_digits)  
    
    if num < 0:
        return "-" + result
    else:
        return result