# Write a function to get all unique pairs of numbers in a list whose sum match the target number

# Function should take two arguments one is the list of numbers and other is the target number

# note (a,b) is same as (b,a)

# Example :
# Input [4,6,7,2,1,4] , 8
# Output [ (4,4) (6,2) (7,1) ]

# Input [4,4,6,2,7,1] , 10
# Output [(6,4)]

# Input [5,4,3,2,1], 6
# Output [(4,2) ,(5,1)]

def sum_pairs(arr, s)
  x = arr.combination(2).select { |x, y| x + y == s }
end

p sum_pairs([5, 4, 3, 2, 1], 6)
p sum_pairs([4, 6, 7, 2, 1, 4], 8)
