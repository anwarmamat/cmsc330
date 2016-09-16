# Exercise 1
# Write a Stack class which is backed by a Ruby array and defines the Push and Pop operations. The skeleton is provided here:

class Stack
	def initialize
		@stack = []
	end

	def push(ele)

	end

	def pop

	end
end

# Test with the following operations:
s = Stack.new
s.push(1)
s.push(2)
s.push(3)
puts s.pop
puts s.pop
puts s.pop

# Exercise 2
# Write a Queue class which is backed by a Ruby array and defines the enqueue and dequeue operations. Provide some small test code to prove that it works.

# Exercise 3
# Create an array called "ary" which is populated either by using the unshift operation, the [] constructor, or Array.new.
# You may populate the list with whatever you like.

# Use the Ruby online documentation to:
# Get the first 3 items from ary
# Create a random permutation of ary
# Sort ary
# Find a specific member of ary.
# Note: You may find that there are many different ways to accomplish these tasks. 
# Try to make sure you're finding the most succint solution that is still readable by people familiar with Ruby.

# Exercise 4
# Create a hash table called "h" which is populated either by using [] and =, the {} constructor, or Hash.new
# Note: Array.new and Hash.new act pretty differently. If you have time, look them up and compare and contrast them.

# Use the Ruby online documentation to:
# Convert h to an array
# Get all of the keys and values of h
# Test if an object is a member of h

# Exercise 5
# Iterate over ary using 3 methods:
# for i in 0..ary.size()
# ary.size().times() do
# ary.each {} (i.e. with a code block)
# Note: .each with a code block is the preferred style for rubyists

# Exercise 6
# Iterate over h using the .each with code block method. Is it possible to get seperate local variables for the keys and values?

# Exercise 7
# Get comfortable with code blocks! Blocks are functions which disguise themselves as {}'s.
# You can use them in a variety of powerful and expressive ways in Ruby.
# Let's start with a function called map that you're going to be seeing a lot of this semester:

# ary2 = [1,2,3]
# ary2.map { |x|
#   x * 2
# }

# Write a function which takes ary3 and appends your name to each string

ary3 = ["Hello, ", "Hi, ", "What's up, "]

# Another cool function is .select. Given a code block which returns a boolean, select returns a list
# of only the elements which evaluate to true.

# ary2.select {
#    x % 2 == 0
# }

# Create a list and a predicate of your choosing and see if you can create an interesting transformation
# using just select and a code block.