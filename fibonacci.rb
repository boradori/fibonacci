
# Create a method is_fibonacci? with an argument.
# Iterate fibonacci sequence
# Each time generate a new number, compare the output
# If the output is greater than the argument, returns false
# Break!
# If the output is equal to the argument, returns true
# Break!
# Else generate a new number continuously


# 3. Initial Solution

def is_fibonacci?(original_num)
  if is_square?(5*(original_num)**2 + 4) == true
    true
  elsif is_square?(5*(original_num)**2 - 4) == true
    true
  else
    false
  end
end

def is_square?(num)
  square_root = sqrt(num)
  square_root ** 2 == num
end

def sqrt(num)
  num1 = 1
  num2 = num

  while num2 > num1 + 1
    current_mid = (num2 + num1)/2
    if current_mid ** 2 <= num
      num1 = current_mid
    else
      num2 = current_mid
    end
  end
  num1
end

# 4. Refactored Solution

def is_fibonacci?(original_num)
  is_square?(5*(original_num)**2 + 4) || is_square?(5*(original_num)**2 - 4) ? true : false
end

def is_square?(num)
  square_root = sqrt(num)
  square_root ** 2 == num
end

def sqrt(num)
  num1 = 1
  num2 = num
  while num2 > num1 + 1
    current_mid = (num2 + num1)/2
    current_mid ** 2 <= num ? num1 = current_mid : num2 = current_mid
  end
  num1
end

# 1. DRIVER TESTS GO BELOW THIS LINE

def random_fibonacci
   [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946].sample
end

#returns true when a integer is one number of the Fibonacci sequence
p is_fibonacci?(random_fibonacci) == true

#returns true with a large Fibonacci number
p is_fibonacci?(8670007398507948658051921) == true

# #returns false when it's not in the Fibonacci seqence
p is_fibonacci?(random_fibonacci+100) == false

# #returns false on large non-Fibonacci numbers
p is_fibonacci?(927372692193078999171) == false

# sqrt method in Ruby did not work out for bignum, 8670007398507948658051921.
# I learned that floor sometimes does not work for bignum.