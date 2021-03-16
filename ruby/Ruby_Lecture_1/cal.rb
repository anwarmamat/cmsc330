#
#	print a year calendar
#
days=[31,29,31,30,31,30,31,31,30,31,30,31]
pos = 3
print "="*50
puts
for month in 1..12
	day = days[month-1]
	puts "\nS\tM\tT\tW\tT\tF\tS\n"
	print "\t"*pos
	for i in 1..day
		print "#{i}\t"
	    pos = pos + 1
	    print "\n" if pos % 7 == 0
	    pos = 0 if pos >6
		end
end