# Given an list of integers called input, return True if any value appears at least twice in the array. Return False if every element in the input list is distinct.

def contains_duplicate(input)-> bool:
  s = set()
  for i in input:
    if i not in s:
      s.add(i)
    else:
      return True
  return False