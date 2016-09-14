
# a mixin example

module M1
  def hello
      "M1 hello"
  end
end

module M2
  def hello
      "M2 hello"
  end
end

class A
  include M1
  include M2
  def hello
     "A hello"
  end
end

a = A.new
puts a.hello    # returns  A hello
puts a.class.ancestors.inspect    #returns [A, M2, M1, Object, Kernel, BasicObject]


