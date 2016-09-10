# Throw out the stuff that doesn't match
f = File.open("sample0.dat")

max_grade = 0
max_student = ""
lineno = 0

f.readlines.each do |line|
  chunks = line.split("|")
  begin 
    student = chunks[0]
    grade = Integer(chunks[1]) # Convert string to int
    # chunks[2] is the project name
    if (grade > max_grade) then
      max_grade = grade
      max_student = student
    end
    lineno = lineno + 1
  rescue Exception => e
    puts "Could not process line #{lineno} "
  ensure 
    lineno = lineno + 1
  end
end

puts "#{max_student} has the grade #{max_grade}"


