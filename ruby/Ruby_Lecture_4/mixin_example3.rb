# class A has a method hello and it is called for a.hello


module M1
  def hello
      "M1 hello"
  end
end

module M2
  def hello_old
      "M2 hello"
  end
end

class A
  include M1
  include M2
  def hello_old
     "A hello"
  end
end

a = A.new
puts a.hello    # returns  M1 hello
puts a.class.ancestors.inspect    #returns [A, M2, M1, Object, Kernel, BasicObject]


# class A does not have  a method hello. look for the mdthod hello from mixin.
# Only M1 has a method hello, which is called.



