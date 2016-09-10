f = File.open("sample1.dat")

max_grade = 0
max_student = ""
lineno = 0
grades = []

f.readlines.each do |line|
  begin
    if line =~ /^([a-z]+)@/ then
      student = $1
      puts student
    end
    count = 0
    totgrade = 0
    line.scan(/p(\d+),(\d+)/) do |proj,grade|
      totgrade += Float(grade)
      count += 1
    end
    avg = totgrade/count
    grades.push([student,avg])
  rescue Exception => e
    # Do nothing
  end
end

grades.sort! { |x,y| x[1] - y[1]  }
puts "Student    Grade (avg)"
grades.each do |student,grade|
  puts "%10s %4s" % [student, grade]
end
