# Write a function to get all palindroms in string.

# A plaindorm is a string if we reverse that string it would remain same.
# like level ,madam ,ada ,

# Minimum length of palindrom should be greater than equal to 2.

# Examples:
#Input "level"
#Output ["level" ,"eve"]

# Input "zxz"
# Output ["zxz"]

# Input "abcreferdeff"
# Output ["refer" , "efe" ,"ff"]

def find_palindromes_in_sub_string(str, j, k)
  while (j >= 0 && k < str.length)
    if (str[j] != str[k])
      break
    end
    puts (str[j..k])
    j -= 1
    k += 1
  end
end

def find_all_palindrome_substrings(str)
  for i in 0..str.length - 1
    find_palindromes_in_sub_string(str, i - 1, i + 1)
    find_palindromes_in_sub_string(str, i, i + 1)
  end
end

find_all_palindrome_substrings("abcreferdeff")
