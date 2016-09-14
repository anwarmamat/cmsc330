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
