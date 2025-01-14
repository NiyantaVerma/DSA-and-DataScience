# Given a valid Roman numeral, convert it to an integer.

# in case you don't think about the Roman empire that often, and need a crash-course on how to go from Superbowl "XLIV" to an actual number

def romanToInt(s):
    rom = {'I':1,'V':5,'X':10,'L':50,'C':100,'D':500,'M':1000}
    ans = 0
    i = 0
    while i < len(s):
        if i+1 <len(s) and rom[s[i+1]] > rom[s[i]]:
            ans += rom[s[i+1]] - rom[s[i]]
            i+=2
        else:
            ans += rom[s[i]]
            i+=1
    return ans
	  