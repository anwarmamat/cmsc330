module M1
       def hello
       	   "m1 says hello, " + super
       end
       def what
      	"Mary"
      end
end


class A
      def hello
      	  "A says hello, " + what
      end
      def what
      	"Alice"
      end
end

class B < A
      include M1
      def hello
          "B says hello, " + super
      end
      def what
      	"Bob"
      end
end

b = B.new
puts B.ancestors.inspect
puts b.hello