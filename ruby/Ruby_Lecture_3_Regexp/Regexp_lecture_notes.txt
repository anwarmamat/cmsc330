# CMSC330 Organiztions of Programming Languages 
# Fall 2016
# Anwar Mamat

# Ruby Regular Expression

#Basic buidling blocks

# single character   a,b,c
# empty string   epsilon
# empty set


#Operation

#concatanation
#union
#Kleene star

# By applying the operation on the buidling blocks, we can build complex patterns.

ab
a|b
(ab)*
(ab)+
(ab)?



ab  concat
a|b union
*		repeat zero of more times
(ab)*	zero or more
(ab)+   one or more
(ab)?  zero or one time
[abcd]  pick one
[^abcd] anything except 
(ab){3,}
(ab|bc)
steve steven stephen

^ste(ve|ven|phen)$ 
^ start 
$ end

#Examples


#pattern="[^b]*b[^b]*b[^b]*b[^b]*$" #contains 3 b's, may not be consecutive.
#pattern = ["^c[aouei][a-z]*$"]	#starts with c, followed by one vowel,
#and any number of letters 

#pattern = "^a*b*c*d*e*f*g*h*i*j*k*l*m*n*o*p*r*t*$" # all letters are in alphabetic order
#pattern << "ruby"	#contains "ruby"
#pattern << "s{3}|c{3}" #contains sss or ccc
#pattern = ["^c[aouei][a-z]*$"] #starts with c, a wovel, and any letter any number of times
#pattern << "(ab){2}" #contains 2 ab
#pattern << "b{2}"  #contins 2b
#pattern = "^a[a-z]?$"  #starts with a, 0 or 1 letter after that
#pattern = "(ab|ba)+" # contains one or more ab
#pattern = "^ste(ve|phen|ven)$"  #steve, steven, or stephen
#pattern = ^ste(ve|phe|)n?$#steve, steven, or stephen
#pattern = "^(..)*$"   #even length string
#pattern = "^([^aouei]*[aouei][^aouei]*[aouei][^aouei]*)*$"  #even number of wovels
#| (^[^b]+(b+[^b])*)      # starts with not-b, 0 or more times of any number of b followed by one nont-b
#pattern = "^(b([^b]+b*)*[^b])$"


# re = Regexp.new("^" + "a" )

# Test the pattersn
# Lists all words from "war and peace" that matched the pattern


pattern = "^(b[a-z]*[^b])$|^([^b][a-z]*b)$"  #starts with b or ends with b, but not both
file="war_peace.txt"
fp = open(file)
cnt = 0
while line =  fp.gets do
    words = line.split(/[<>\/,?!.\s'\-()":;*]/)  #split each line into a words array
    words.each{|word| 
      word.downcase!
      if(word.match(/#{pattern}/))
        print word,"\t"
        cnt += 1
      end
        exit if cnt >  10
    }
end
