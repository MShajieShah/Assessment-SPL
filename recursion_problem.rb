# #Recursion Program On:

#reverse a string and remove all vowel letters

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
    return 0
  else
    sum = arr.pop
    return sum + sum_num(arr)
  end
end

p sum_num([])

#factorial

def factorial(number)
  if (0..1).include?(number)
    return 1
  else
    number * factorial(number - 1)
  end
end

p factorial(0)

#average
def find_avg(arr)
  n = arr.size
  if (n == 1)
    return sum = arr[0]
  else
    sum = arr.pop
    sum = (sum + find_avg(arr)).to_f
  end
  sum / 2
end

p find_avg([1, 2, 3, 4, 5])

#count down
def countdown(n)
  return if n == 0
  puts n
  countdown(n - 1)
end

p countdown(3)

#fabonacci
def fib(n)
  return n if n < 2
  p fib(n - 1) + fib(n - 2)
end

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

#count vowel
def count_vowels(s)
  if s.empty?
    return 0
  elsif s[0].match(/[aeiou]/)
    return 1 + count_vowels(s[1..-1])
  else
    return 0 + count_vowels(s[1..-1])
  end
end

p count_vowels("apple")

# repeat summing until you get one digit.

def add_digits(num)
  if num > 0
    return (num - 1) % 9 + 1
  else 0   end
end

p add_digits(881)

# Power

def power(x, y)
  result = 1
  if (y == 0)
    return result
  else
    result = x * (power(x, y - 1))
  end
end

#Recursive function packs allocated for packing space
class Bakery
  attr_accessor :selected_packs

  def initialize
    @packs = [5, 3]
    @selected_packs = []
  end

  def allocate(qty)
    remaining_qty = nil
    @packs.each do |pack|
      remaining_qty = qty - pack
      if remaining_qty > 0
        ret_val = allocate(remaining_qty)
        if ret_val == 0
          @selected_packs << pack
          remaining_qty = 0
          break
        end
      elsif remaining_qty == 0
        @selected_packs << pack
        break
      end
    end
    remaining_qty
  end
end

bakery = Bakery.new
bakery.allocate(16)
puts "Pack combination is: #{bakery.selected_packs}"