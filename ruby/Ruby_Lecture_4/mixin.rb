module A
   def a1
     puts "A a1"
   end
   def a2
     puts "A a2"
   end
   def s2
     puts "A s2"
   end
end
module B
  def b1
    puts "B b1"
   end
  def b2
    puts "B b2"
   end
  def s2
    puts "B s2"
  end
end

class P
  def s2
    puts "Parent s2"
  end
end

class Sample < P
include A
include B
def s1
  puts "Sample s1"
   end
def s2
  puts "Sample s2"
end

end

samp=Sample.new
samp.a1
samp.a2
samp.b1
samp.b2
samp.s1
samp.s2
