# CMSC330 Organiztions of Programming Languages
# Fall 2016
# Anwar Mamat

# opens a webpage and collects all the phone numbers on that page

require 'open-uri'
open("http://admissions.umd.edu") {|src|

  while line = src.gets do
  	 words = line.split(/[<>\/]/)
  	 words.each{ |word|
  	 	if (/\d{3}\.\d{3}\.\d{4}/.match(word)) then # match phone numbers in 111.111.1111 format
	  		puts word
    	end
    }
  end
  
}
