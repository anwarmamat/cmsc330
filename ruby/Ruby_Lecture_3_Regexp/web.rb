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
