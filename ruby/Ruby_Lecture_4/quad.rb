x = 10
def twice	  # implicit block
  yield     # invoked with yield
  yield
end
twice { x += 1 }  # same as x += 2
puts x
def quad (&block) # explicit block
  twice &block  # used as argument
  twice &block
end
quad { x += 1 }   # same as x += 4
puts x
