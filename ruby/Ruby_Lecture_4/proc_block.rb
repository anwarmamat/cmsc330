p = Proc.new {|x|x+1}

def foo1(b)
	b.call 10
end

foo(p)


def foo2(&b)
	b.call 10
end

# foo2 receives an explicit code block and makes an proc obejct and call
foo2 {|x| x+1}


# foo3 receives an implicit code block
def foo3
	yield 10
end

foo3{|x| x+1}

# foo3 receives an argument and an implicit code block
def foo4(x)
	yield x
end

foo4(10){|x| x+1}

#or send a proc as a code block
foo3(&p)
