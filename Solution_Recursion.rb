# Write a recursive algorithm to reverse a string and remove all vowel letters during recursion.

# Function should take one string as input
# Example:
# Input -> "abcdefghi"
# Output -> "hgfdcb"

# Input -> "aeiowqu"
# Output -> "qw"
def reverse_string(str)
  a = str.split("")
  a.delete_if { |element| "aeiou".include?(element) }
  string = a.join("")
  reversed_str = ""
  i = 0
  while i < string.length
    reversed_str = string[i] + reversed_str
    i += 1
  end
  reversed_str
end

p reverse_string("abcdefghi")
p reverse_string("aeiowqu")

# Write a recursive algorihum to find average of list

# Function should take one list as argument

# Example
# Input -> [2,3,4,5,1]
# Output -> 3

def average(a)
  sum = 0
  i = 0
  n = a.size
  while i < n
    sum += a[i]
    i += 1
  end
  sum / n
end

p average([2, 3, 4, 5, 1])
p average([10, 2, 3, 4, 5, 6, 7, 8, 9])
