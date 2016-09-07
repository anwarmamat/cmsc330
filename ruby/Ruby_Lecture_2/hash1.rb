# CMSC330 Organiztions of Programming Languages 
# Fall 2016
# Anwar Mamat

# 0   5  0
# 1   0  0
# 0   0  3

h ={}
h[1]={}
h[1][1]=0
h[1][2]=5
h[1][3]=0
h[2]={}
h[2][1]=1
h[2][2]=0
h[2][3]=0
h[3]={}
h[3][1]=0
h[3][2]=0
h[3][3]=3

(1..3).each {|i|
  (1..3).each{|j|
    print "#{h[i][j]}\t"
  }
  puts
}
