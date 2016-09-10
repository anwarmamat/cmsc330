# Calculate the student with the higest grade
f = File.open("sample0.dat")

max_grade = 0
max_student = ""

f.readlines.each do |line|
  chunks = line.split("|")
  student = chunks[0]
  grade = Integer(chunks[1]) # Convert string to int
  # chunks[2] is the project name
  if (grade > max_grade) then
    max_grade = grade
    max_student = student
  end
end

puts "#{max_student} has the grade #{max_grade}"

