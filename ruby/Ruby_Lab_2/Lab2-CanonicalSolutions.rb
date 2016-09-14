# Exercise 1
# Code Blocks and Arrays
# By now you should be pretty adept at using code blocks. Still, here's some warm-up
# problems which are a little more challenging than last week's.
# As usual, consult Ruby documentation and ask your TA/neighbor for help

# Given ary, use the method delete_if to modify it to remove all the strings of even length.
# Afterwards, use the method sort_by to sort the remaining strings by comparing their final characters
# Try to create the most elegant "rubyist" solution you can!
ary = ["Adam", "Austin", "Damien", "Anwar", "Craig"]

ary.delete_if { |instructor|
   instructor.length % 2 == 0
}

ary.sort_by {|instructor|
   instructor[-1]
}

# Given power_levels, use the method select! to modify it to contain only key,value pairs where the
# keys are of shorter lengths than the values
power_levels = { "Damien" => "2",
                 "Austin" => "3",
                 "Anwar" => "400000",
                 "Adam" => "Unlimited" }

power_levels.select! {|key, value|
   key.length < value.length
}

# Exercise 2
# Regular Expression Warm-up
# For the following exercises, familiarize yourself with Ruby's regex syntax. Use the symbols
# *, |, ?, +, and ()'s as necessary.
# The following regex matches the word "grey" Modify it to match the alternate spelling "gray"

r = /^grey$/

r = /^gr(e|a)y$/

"grey" =~ r
"gray" =~ r

# Write a regex which matches the words "color" and "colour"

r = //

r = /^colou?r$/

"color" =~ r
"colour" =~ r

# Write a regex which matches 1 or more "na"'s before ", Batman!"

r = //

r = /^(na)+, Batman!$/ 

"nana, Batman!" =~ r
"nananana, Batman!" =~ r
"na, Batman!" =~ r

# Exercise 3
# Code Blocks and Yield
# The following class represents a traveller who has a small group of cities they can reach.
# Define the method travel, which takes an argument "from".
# If no block is given to travel, the method should not do anything.
# If a block is given, the method should loop through all of the cities adjacent to "from" in the
# hash table, and for each adjacent city, yield to the block the value for "from" and the adjacent city

class Traveller
   @@cities = { "detroit" => ["cleveland", "columbus"],
                "chicago" => ["columbus", "indianapolis"],
                "columbus" => ["detroit", "cincinnati"] }

   def travel(from)
      if block_given? then
         @@cities[from].each do |dest|
            yield from, dest
         end
      end
   end
end

t = Traveller.new
t.travel("detroit") { |from, dest| puts "#{dest} is reachable from #{from}" }

# Exercise 4
# Mixins
# Below is the return of the venerable Stack datastructure. However, this time we want the ability
# to enumerate and compare stacks. Using the ruby documentation for the Enumerable and Comparable modules
# and mixins, implement the missing functionalities.
# We want to:
# * Iterate through Stack elements using a code block
# * Compare stacks based on size. If two stacks are equal, you should do an element by element comparison
# * If all the elements are equal, then the stacks are equal.
# NOTE: Since ruby variables are always private, you'll need to find a way to make @s accessible.

class Stack
   include Enumerable
   include Comparable

   def initialize
      @s = []
   end

   def push(ele)
      @s.push(ele)
   end

   def pop(ele)
      @s.pop(ele)
   end

   def each
      @s.each do |ele|
         yield ele
      end
   end

   def s
      @s
   end

   def <=>(other)
      if @s.length < other.s.length
         return -1;
      elsif @s.length > other.s.length
         return 1;
      else
         return @s <=> other.s
      end
   end
end

s1 = Stack.new
s2 = Stack.new

s1.push("eggplant")
s1.push("tomato")
s1.push("avacado")
s2.push("peach")
s2.push("blackberry")

s1 >= s2
s1.each { |veggie| puts veggie }
