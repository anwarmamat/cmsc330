# CMSC330 Organiztions of Programming Languages 
# Fall 2016
# Anwar Mamat

class Point
      def x=(x)
           @x = x
      end
    
      def x
      	  @x
      end
      def y=(y)
           @y = y
      end
    
      def y
      	  @y
      end
      # make the method prt private
      private
      def prt
      	  "#{@x}, #{@y}"
      end
      #Make the below methods public
      public 
      def to_s
      	  prt
      end

end

