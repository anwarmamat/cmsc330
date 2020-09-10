
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

#code 
def filter(a)
  a.each{|x| if (yield x) then puts x.inspect end}
end


reds(apples)

bigs(apples)

big_red(apples)

filter(apples){|apple| apple.color=="green"}

filter(apples){|apple| apple.weight < 150}

filter(apples){|a| a.color=="red" and a.weight < 100}




