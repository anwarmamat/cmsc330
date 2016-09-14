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
s.grades = 9.7

puts s.full_name
puts s.city_state_zip
puts ContactInfo.contact



===========================
module ContactInfo
	attr_accessor :first_name, :last_name, :city, :state, :zip_code
	NAME="Alice"
	def full_name
		return @first_name + ' ' + last_name
	end
	
	def city_state_zip
		csz = @city
		csz += @state if @state
		csz += @zip_code if @zip_code
		return csz
	end
	def ContactInfo.contact
		return NAME
	end
end
