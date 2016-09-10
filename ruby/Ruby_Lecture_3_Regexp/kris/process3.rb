# Throw out the stuff that doesn't match
f = File.open("sample1.dat")

max_grade = 0
max_student = ""
lineno = 0

f.readlines.each do |line|
  if line =~ /^([a-z]+)@/ then
    student = $1
    puts student
  end
end


