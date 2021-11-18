#Write a function to remove duplicates from sorted array. Dont use any ruby builtin functions. Create your own functions

# Example:
#Input [111 ,112,112, 114 , 115, 116, 117 , 118 , 119]
#Output [111,114,115,116,117,118,119]

#Input [1,1,1,1,2,2,3,3,4,4,5,6]
#Output [1,2,3,4,5,6]

def remove_duplicates(array)
  c = []
  array.each do |n|
    c << n unless c.include?(n)
  end
  return c
end

p remove_duplicates([1, 1, 1, 1, 2, 2, 3, 3, 4, 4, 5, 6])
