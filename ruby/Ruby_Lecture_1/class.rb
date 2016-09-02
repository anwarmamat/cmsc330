# CMSC330 Organiztions of Programming Languages 
# Fall 2016
# Anwar Mamat

#subclass overrides the method in the base class if the method name is same. 

class A
      def m1(x)
      	  x
      end
end

class B < A
      #m1 overrides m1 in A although they have different argument list
      def m1(x,y)
      	  x+y
      end
end


      	  