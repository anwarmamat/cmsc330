# Throw out the stuff that doesn't match
f = File.open("sample1.dat")

max_grade = 0
max_student = ""
lineno = 0
grades = []

f.readlines.each do |line|
  if line =~ /^([a-z]+)@/ then
    student = $1
  end
  count = 0
  totgrade = 0
  line.scan(/((p\d+),(\d+))/) do |match,proj,grade|
    totgrade += Float(grade)
    count += 1
  end
  avg = totgrade/count
  # puts "Student #{student} has average #{totgrade/count}"
  grades.push([student,avg])
end

puts grades.inspect

grades.sort! { |x,y| x[1] - y[1] }
puts "Student    Grade (avg)"
grades.each do |student,grade|
  puts "%10s %4s" % [student, grade]
end
