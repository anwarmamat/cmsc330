class Student
	attr_reader:id,:name
	include Comparable
	def initialize(id, name)
		@id = id
		@name = name
	end
	def to_s
		"#{@id}:#{@name}"
	end
	def <=> (other)
		#if @id > other.id
		#	1
		#elsif @id == other.id
		#	0
		#else
		#	-1
		#end
		
		if @name > other.name
			1
		elsif @name == other.name
			0
		else
			-1
		end
	
	end
end
	s1 = Student.new(10,'alice')
	s2 = Student.new(5,'bob')
	
	a=[s1,s2]
	puts a.sort