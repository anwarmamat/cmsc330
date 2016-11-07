class Duck
  def quack
    puts "Quaaaaaack!"
  end
	
  def walk
    puts "I can walk"
  end
end

class Person
  def speak
    puts "I quack like a duck."
  end
	
  def walk 
    puts "I walk like a duck."
  end
 
  
end

def in_the_forest(duck)
  duck.quack
  duck.walk
end

def game
  donald = Duck.new
  john = Person.new
  in_the_forest donald
  in_the_forest john
end

game