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
def findavg(a)
  n = a.size
  if (n == 1)
    return sum = a[0]
  else
    sum = a.pop
    sum = sum + findavg(a)
  end
  sum / 2
end

p findavg([1, 2, 3, 4, 5])

#count down
def countdown(n)
  return if n == 0
  puts n
  countdown(n - 1)
end

p countdown(3)

# factorial

def fac(n)
  if (n == 0 || n == 1)
    return 1
  else
    return n * fac(n - 1)
  end
end

p fac(5)

def fun1(n)
  if (n == 1)
    return 0
  else
    p 1 + fun1(n / 2)
  end
end

p fun1(7)

#deep
def rec_naive(num)
  if num == 1
    return num
  else
    rec_naive(num - 1) + num
  end
end

p rec_naive(100)

# length
def length(s)
  if s.empty?
    0
  else
    1 + length(s[1..-1])
  end
end

p length("apple")

#sum of multiplication
def multi_sum(num, ten = 10)
  if ten == 0
    return 0
  else
    return num * ten + multi_sum(num, ten - 1)
  end
end

p multi_sum(10)
