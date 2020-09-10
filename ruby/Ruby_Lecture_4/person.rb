$LOAD_PATH << '.'
require 'contact.rb'

class Person
	include ContactInfo
end

class Teacher
	include ContactInfo
end

class Student < Person
	attr_accessor :grades
end

s = Student.new

s.first_name = 'David'
s.last_name = 'Smith'
s.city = 'College Park'
s.zip_code = '20740'
s.grades = 9.7 # only this one, instance variable of the student class

puts s.full_name
puts s.city_state_zip
puts ContactInfo.contact


