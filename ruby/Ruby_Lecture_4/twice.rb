def twice
  yield
  yield
end
x = 1
twice {x += 1}
puts x  # 3
