# You’re at a Data Science conference with an unknown number of attendees. The attendees have a wide range of titles, such as Data Scientist, Data Analyst, ML Product Manager, ML Engineer, Founder, CTO, and others.

# During the event, you ask a sample of n attendees the following question:

# "How many other people here have you met with the same title as you?"

# Each response is recorded in the answers array, where answers[i] is the response of the i-th person you surveyed. Assume that each person you surveyed has encountered every other person at the conference with the same title.

# Given the array answers, return the minimum possible total number of attendees at the conference.

# Examples:
# Example 1:
# Input: answers = [2, 1, 1]
# Output: 5

def min_attendees(answers):
  answers.sort()
  output = 0
  i=0
  while i<len(answers):
    if answers[i]==0:
      output+=1
      i+=1
    else:
      count=0
      j = i
      while j < len(answers):
        if answers[j]==answers[i]:
          count+=1
          j=j+1
        else:
          break
      if count%(answers[i]+1) != 0:
        output+=(count//(answers[i]+1))*(answers[i]+1)+answers[i]+1
      else:
        output+=answers[i]+1
      i = j
  return output