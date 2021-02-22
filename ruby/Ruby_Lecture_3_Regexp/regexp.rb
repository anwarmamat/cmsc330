# Test the pattersn
# Lists all words from "war and peace" that matched the pattern

#pattern = "^b[a-z]*s$"    # starts with b #and ends with s

pattern="^a*b*c*d*e*f*g*h*i*j*k*l*m*n*o*p*r*t*u*v*w*x*y*z*$"


file="war_peace.txt"
fp = open(file)
matched_list={}

n = 20    #number of words before stop matching

while (line =  fp.gets) && matched_list.size < n do
  words = line.split(/[<>\/,?!.\s'\-()":;*]/)  #split each line into a words array
  words.each{|word| 
    word = word.downcase 
    if(word.match(/#{pattern}/) )
      matched_list[word]=true
      break if matched_list.size >  n
    end
    
    }
end

matched_list.keys.each{|w|
  puts w
}
puts "\nEnd of List"
