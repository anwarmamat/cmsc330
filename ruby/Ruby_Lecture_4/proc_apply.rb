double = Proc.new {|x| x * 2}

def apply (f, list)
	a=[]
	0.upto(list.length-1){|i|
		a.push(f.call list[i])
	}
	return a
end

b = apply double, [1,2,3,4]
puts b.inspect