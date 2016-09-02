class Shape
	attr_reader :name
	def initialize(name)
		@name = name
	end
end
class Rect < Shape
	attr_writer :width
	def initialize(h,w)
		super('Rect')
		@height = h;
		@width = w;
	end
	
	def h
		@height
	end
	def w
		@width
	end
	#def set_width (n)
	#	@width = n
	#end
	def area
		@height * @width
	end
end


class Circle <  Shape
	attr_reader :radius
	def initialize(r)
		super('Cirlce')
		@radius = r;
	end
	def area
		@radius * @radius * 3.14
	end
end

class Square < Rect
	def initialize(sd)
		super(sd,sd)
	end
	def side
		@height
	end
end

r = Rect.new(10,20)
puts r.name
puts "(#{r.h},#{r.w})"
r.width = 200
puts "area=#{r.area}"


r = Circle.new(10)
puts r.name
puts r.radius
puts r.area

r = Square.new(10)
puts r.name
puts r.side
puts r.area