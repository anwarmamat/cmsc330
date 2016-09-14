class Base
	def a
		"Base a"
	end
end
	
module A
	def a
		"A a" + super
	end
end
module B
	def a 
		"B a" + super
	end
end

class C  <Base
	include A
	include B
end

