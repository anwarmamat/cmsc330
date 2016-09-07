# CMSC330 Organizations of Programming Languages Fall 2016
# Anwar Mamat
# Lecture 1   Ruby classes
#
#	Fraction class
#
class Fraction
	include Comparable
	attr_reader :numerator, :denominator
	#attr_writer :numerator, :denominator
	
	@@count = 0   #class variable
	MAX=100		   # class constant
				   #constants are public and can be used by 
				   #Fraction::MAX
	
	#access class variable count
	def Fraction.count
		@@count
	end
	
	#	constructor
	#	default value n=0, d=1
	def initialize(n=0, d=1)
		raise ZeroDivisionError if d == 0
		g = gcd(n,d)
		@numerator = n /g 	#simplify the fraction
		@denominator = d /g
		@@count += 1
	end
	
	#numerator mutator(seter)
	def numerator=(n)
		g = gcd(n, @denominator)
		@numerator = n / g
		@denominator /= g
	end
	
	#private gcd method
	def gcd(a,b)
		a = a.abs
		b = b.abs
		a,b = b,a if a < b
		b==0 ?a : gcd(b, a%b)
	end
	private :gcd
	
	def to_s
		if @numerator == 0 
			"0"
		elsif @denominator == 1
			"#{@numerator}"
		else
			"#{@numerator}/#{@denominator}"
		end
	end
	
	#def numerator
	#	@numerator
	#end
	#def denominator
	#		@denominator
	#end
	
	#overload + operator
	def +(f2)
		raise TypeError, "Fraction argument exected" unless f2.is_a? Fraction
		x = Fraction.new(@numerator * f2.denominator + 
		@denominator * f2.numerator, 
		@denominator * f2.denominator)
	end
	def -(f2)
		raise TypeError, "Fraction argument exected" unless f2.is_a? Fraction
		x = Fraction.new(@numerator * f2.denominator - 
				@denominator * f2.numerator, 
				@denominator * f2.denominator)
	end
	def *(f2)
		raise TypeError, "Fraction argument exected" unless f2.is_a? Fraction
		x = Fraction.new(@numerator * f2.numerator,
					@denominator * f2.denominator)
	end
	def /(f2)
		raise TypeError, "Fraction argument exected" unless f2.is_a? Fraction
		x=Fraction.new(@numerator * f2.denominator, @denominator * f2.numerator)
	end
	
	#iterator
	def each
		yield @numerator
		yield @denominator
	end
	
	#overload == operator
	def ==(f2)
		if f2.is_a? Fraction
			@numerator == f2.numerator && @denominator == f2.denominator
		else
			false
		end
	 end
	
	# method alias
	alias eql? ==
	
	#generate hashcode
	def hash
		code = 17
		code = 37 * code + @numerator.hash
		code = 37 * code + @denominator.hash
		code
	end
	
	# make it comparable
	def <=>(f2)
		#puts f2.inspect
		t = self - f2
		t.numerator
	end
end

# class inheritance
class MixedFraction < Fraction
	def initialize(i=0, n=0, d=1)
		super(i * d +n, d)
	end
	
	#  override to_s
	def to_s
		i = @numerator / @denominator
		n = @numerator % @denominator
		d = @denominator
		"#{i} #{n}/#{d}"
	end
	

end

#tests

f1 = Fraction.new(3,5)
#f1.numerator = 35
print "f1=#{f1}\n"
f2 = Fraction.new(4,6)
print "f2=#{f2}\n"
f3 = f1 + f2
print f1 ,"+", f2,"=", f3,"\n"

f4 = f1 * f2
print f1 ,"*", f2,"=", f4,"\n"

f6 = f1 / f2
print f1 ," / ", f2,"=", f6,"\n"

f7 = f1 - f2
print f1 ," - ", f2,"=", f7,"\n"


m1 = MixedFraction.new(7,2,3)

#puts m1.methods

print "m1=#{m1}\n"
f5 = m1 + f1
print m1 ,"+", f1,"=", f5,"\n"

#puts f1.gcd(24,36)

puts "iterate"
f1.each{|x| puts x}

f10 = Fraction.new(3,5)

if( f1 == f10)
	puts "#{f1} equal  #{f10}" 
else
	puts "#{f1} NOT equal #{f10}" 
end


if( f1.eql?(f10))
	puts "#{f1} equal  #{f10}"  
else
	puts "NOT equal" 
end

if((f1 > f2))
	puts "#{f1} greater than #{f2}" 
else
	puts "#{f1} less than #{f2}" 
end

puts Fraction.count
puts Fraction::MAX

f11 = f1.dup
puts f1.object_id
puts f11.object_id
