#print the methods of FixNum object
1.methods.each{|m| puts m if m.to_s.start_with?("f")}