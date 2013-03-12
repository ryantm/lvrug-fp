require 'pry'


## Side Effects
# Mutation
Item = Struct.new(:name,:price)
i = Item.new("Apple", 2)
def not_f(i)  i.name = "Orange"; i; end
binding.pry





# No Mutation
i = Item.new("Apple", 2)
def f(i) i = i.dup; i.name = "Orange"; i; end
binding.pry #freeze





# Hamster Immutable Collections (list, stack, queue, hash, set, vector)
require 'hamster/hash'
simon = Hamster.hash(:name => "Simon", :gender => :male)
james = simon.put(:name, "James")
male = simon.delete(:name)
# no []= !
binding.pry





#IO Side effects
def side_effect
  puts "Hello"
end
binding.pry





# State
def state_maker
  state = 0 # hidden state
  -> { state += 1}
end
binding.pry





# Where you can see it
state = 0
def plus_one(number)
  number + 1
end
binding.pry






# Memoize
FibonacciResults = {}
def fibonacci(n)
  result = (n < 2 ? 1 : fibonacci(n - 1) + fibonacci(n - 2))
  FibonacciResults[n] = result
  result
end
binding.pry #whereami 7







# Partial application
def multiply(x, y) x*y; end
def multiply_by_2(y) multiply(2, y); end
binding.pry





#if return
hello = if true
          "world"
        else "mars"
        end
binding.pry
# also case
