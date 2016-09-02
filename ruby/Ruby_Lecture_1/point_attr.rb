# CMSC330 Organiztions of Programming Languages 
# Fall 2016
# Anwar Mamat

class Point
      attr_accessor :x, :y
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

