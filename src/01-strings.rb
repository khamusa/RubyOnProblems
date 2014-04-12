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

	# trying to use lower level constructs, recursive solution, but couldn't get rid or Regexes :D
	def is_palindrome_3?
		return true unless length > 1
		return self[1..-1].is_palindrome_3? unless (self[0] =~ /[[:alpha:][:digit:]]/)
		return self[0..-2].is_palindrome_3? unless (self[-1] =~ /[[:alpha:][:digit:]]/)
		self[0].downcase == self[-1].downcase && self[1..-2].is_palindrome_3?
	end
end