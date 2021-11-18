# Move all even numbers to the left side of the array and maintain their order in which they are coming .
# Constraints: You have to do this inline(you are not allowed to initialize data structure)
# Hint: use swap

# Example:
# Input -> [1,2,3,4,5,6,7,8,9]
# Output ->[2,4,6,8,remaining odd digits in any order]

#Input -> [2,4,6,7,8]
#Output -> [2,4,6,8,7]

#Input -> [1,3,5,7]
#Output -> [1,3,5,7]

#Input -> [1,3,5,7,8]
#output -> [8,1,3,5,7] or [8,5,7,3,1]

# Notice the pattern Main thing is that even numbers are on the left side of the array staying in the order in
# which they are in the array. And on odd number there are not any constraint they can be any order but the final array
# should follow the rules even number on left of the array in order they exist and remaining odd after the evens numbers end
#  and they can be be any order.
def swap(arr)
  c = []
  d = []
  arr.each do
    |x|
    if x.even?
      c << x
      c.sort
    else
      d << x
    end
  end
  c + d
end

p swap([1, 3, 5, 7, 8])
p swap([1, 3, 5, 7])
p swap([1, 2, 3, 4, 5, 6, 7, 8, 9])
p swap([2, 4, 6, 7, 8])
