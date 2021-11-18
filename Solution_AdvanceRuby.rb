# write a function to sort the list of number in decreasing order (use ruby builtin sort function)

# Solve these set of questions using ruby higher order functions that are ruby builtin

def sort_arr(arr)
  arr.sort.reverse
end

p sort_arr([1, 2, 3, 4, 5])

# 1) Write a function which takes sum of only even numbers in a list and return that sum.

def sum_even_nums(arr)
  arr.select { |value| value.even? }.reduce { |result, value| result + value }
end

p sum_even_nums([1, 2, 3, 4, 5, 6])

# 2) Write a function that will take the square of the number when it is even . take the cube root of the digit
# when it is odd and then take the sum.
# Function will return one scalar value(single value)

# Examples:
# Input [2,3,4]
# Output should be 29(2^2 + 3^3 + 4^2 = 4 + 9 + 16 = 29)

def sqr_of_num(arr)
  c = []
  arr.each do |x|
    if x.even?
      c << x * x
    else
      c << x * x
    end
  end
  c.sum
end

p sqr_of_num([2, 5, 4])

# 3)write a function to find the frequency of characters in a string
# Input "aabccc"
# output {"a"=>2 , "b"=>1 , "c"=>3}
# we define a method letter_count that accepts one argument str
def letter_count(str)
  counts = {}
  str.each_char do |char|
    next if char == " "
    counts[char] = 0 unless counts.include?(char)
    counts[char] += 1
  end
  counts
end

p letter_count("aabccc")