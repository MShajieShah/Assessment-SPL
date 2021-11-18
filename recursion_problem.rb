#Recursion Program On:

#reverse a string

def reverse_string(str)
  a = str.size < 2 ? str : str[-1] + reverse_string(str[1..-2]) + str[0]
  a = a.split("")
  a.delete_if { |element| "aeiou".include?(element) }
  string = a.join("")
end

p reverse_string("abcdefghi")

#sum a string

def sum_num(arr)
  if arr.size == 0
    return "Empty"
  else
    sum = arr.pop
    return sum + sum_num(arr)
  end
end

p sum_num([])

#fabonacci series

def factorial(number)
  if (0..1).include?(number)
    return 1
  else
    number * factorial(number - 1)
  end
end

p factorial(0)

#average
