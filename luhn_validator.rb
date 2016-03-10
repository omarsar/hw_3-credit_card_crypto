module LuhnValidator
	# Validates credit card number using Luhn Algorithm
	# arguments: none
	# assumes: a local String called 'number' exists
	# returns: true/false whether last digit is correct
	
	#Faster checksum
	def validate_checksum_elvis
		nums_a = number.to_s.chars.map(&:to_i)
		sum = 0

		nums_a.reverse_each.with_index do |num, i|
			if i.even?
				sum += num
			else
				product = num * 2
				if product <= 9
					sum += product
				else
					sum += product / 10 + product % 10
				end
			end
		end
		sum % 10 == 0 ? true : false
	end

	#Slower but more elegant
	def elegant_validate_checksum
		nums_a = number.to_s.chars.map(&:to_i)
		sum = 0

		nums_a.reverse_each.with_index do |num, i|
			if i.even?
				sum += num
			else
				sum += (2 * num).divmod(10).inject(:+)
			end
		end
		sum % 10 == 0 ? true : false
	end
end
