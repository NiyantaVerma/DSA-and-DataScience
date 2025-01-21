# You're on Meta (Facebook's) Newsfeed Ads Team, working on an experiment to increase the number of video ads served up in a person's newsfeed.

# The newsfeed ranking team gives you a list of feed_items which denotes what type of content their algo is planning to serve a user.

# 0 denotes a normal post
# 1 denotes a video
# 2 denotes a non-video ad
# You want to insert n more video ads; however, you can't place a video ad next to an existing video otherwise users will be annoyed about Meta's newsfeed being too video-heavy. Similarly, you can't place a video ad next to a non-video ad, because you don't want to overwhelm the user with consecutive ads.

# Is it possible to insert n more video ads into the feed based on feed_items?

# Example 1:
# Input: feed_items = [1, 2, 0, 0, 0], n = 3

# Output: True

def can_insert_ads(feed_items, n):
  ans = 0
  for i in range(1,len(feed_items)):
    if feed_items[i-1] in [1,2] or feed_items[i] in [1,2]:
      continue
    else:
      ans+=1
  if feed_items[0] not in [1,2]:
    ans+=1
  if feed_items[-1] not in [1,2]:
    ans+=1
  if ans >= n:
    return True
  else:
    return False