x = 100

def quad (&block) # explicit block
  c = block       # no ampersand!
  twice (c)       # used as argument
  twice (c)
end

def twice c	   # arg = explicit closure
  c.call          # invoke with .call
  c.call
end
quad { x += 1 }   # same as x += 4

puts x