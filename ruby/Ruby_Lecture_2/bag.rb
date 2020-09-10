# CMSC330 Organiztions of Programming Languages 
# Fall 2016
# Anwar Mamat


class Bag
	def initialize(a)
		if a.is_a? Array then
			@a=a
		else
			@a=[a]
		end
	end
	
	def insert(elem)
		@a.push(elem)
	end
	def to_s
		str = String.new
		str = "("
		@a.each{
                  |x| str += "#{x}"
                }
		str +=")\n"
	end
	def each()
		@a.each{|x| 
			yield x
		}
	end
	include Enumerable
end

s = Bag.new([6,2,10,5])
#s.each{|x| puts  x+1}
puts s
sorted = s.sort
print sorted.inspect
puts
d = s.map{|x| x*2}# we did not implement map, collect, select, or find
puts d.inspect






