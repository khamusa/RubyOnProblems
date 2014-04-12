class String
	# determine if a string is a palindrome
	def is_palindrome?
		pre = self.downcase.gsub(/[^a-zA-Z0-9]/, '')
		pre.reverse == pre
	end

	def is_palindrome_2?
		letters = self.downcase.scan(/\w/) 	# returns an array of characters
    	letters == letters.reverse			# this reverse is called on an array
	end
end