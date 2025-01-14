# Given an array containing exactly three unique points, each represented as coordinate pairs (x, y) with no duplicates, determine whether these points lie on the same straight line. Return True if they do, and False otherwise.

def on_straight_line(points):
  x1, y1 = points[0]
  x2, y2 = points[1]
  x3, y3 = points[2]
  area = x1*(y2-y3)+x2*(y3-y1)+x3*(y1-y2)
  if area == 0:
    return True
  else:
    return False