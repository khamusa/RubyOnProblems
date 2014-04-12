class String
	# determine if a string is a palindrome
	def is_palindrome?
		pre = self.downcase.gsub(/[^a-zA-Z]/, '')
		pre.reverse == pre
	end
end