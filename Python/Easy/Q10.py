# Given a string phrase, return True if it is a palindrome, otherwise return False.

# A palindrome is a string that reads the same forward and backward. It is also case-insensitive and ignores all non-alphanumeric characters.

# Challenge: Try solving this without using extra memory. Specifically, solve it without making a copy of phrase.
# Clarifications:
# phrase is made up of only: letters, numbers, spaces, and standard punctuation/symbols

def isPalindrome(phrase):
  phrase = phrase.lower()
  left = 0
  right = len(phrase)-1
  while left < right:
    if not phrase[left].isalnum():
      left = left+1
      continue
    if not phrase[right].isalnum():
      right = right-1
      continue
    if phrase[left].lower() == phrase[right].lower():  
      left = left+1
      right = right-1
    else:
      return False
  return True