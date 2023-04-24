require 'debug'
def some_method
    a = 10
    b = 20
    binding.break
    c = a + b
    c
  end
  
  result = some_method
  puts result