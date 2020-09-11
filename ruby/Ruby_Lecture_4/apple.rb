# 
# Code blocks allow us to pass not only values but also behaviors
# to functions. This can raise the level of our abstraction and
# reduce the cumbersome repetitive code
#


class Apple
  attr_accessor :weight, :color
  def initialize(weight,color)
    @color=color
    @weight=weight
  end
end

apples = [Apple.new(100,"red"), Apple.new(200, "red"),Apple.new(50,"green"),Apple.new(180,"yellow")]

puts apples.inspect

# find all red apples
def reds (a)
  a.each{|x| if x.color == "red" then puts "red" end}
end

def bigs(a)
  a.each{|x| if (x.weight > 150) then puts "big" end}
end

def big_red(a)
  a.each{|x| if (x.weight > 150 and x.color="red") then puts "big red" end}
end

# Now, let us generalize this.
# filter receives a code block and use the code block as the predicate

def filter(a)
  a.each{|x|
    if (yield x) then
      puts "#{x.weight},#{x.color}"
    end
  }
end


# Without code blocks, we have to add a function for each type of new requirement

#all red apples
reds(apples)
#all big apples
bigs(apples)
#red and big apples
big_red(apples)


# With filter, we only have to send the new requirements

#all green apples
filter(apples){|apple| apple.color=="green"}
#all small apples
filter(apples){|apple| apple.weight < 150}
#all red and small apples
filter(apples){|a| a.color=="red" and a.weight < 100}




