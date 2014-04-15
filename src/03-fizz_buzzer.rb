class FizzBuzzer
	def fizz_to max
		((@current ||= 1)..max).to_a.map { |number| fizz_or_buzz(number) }.join(' ')
	end

	private
	def fizz_or_buzz number
		str = ''
		str << 'fizz' if will_it_fizz number
		str << 'buzz' if will_it_buzz number
		str.empty? ? number : str
	end

	def will_it_fizz number
		(number % 3 == 0)
	end

	def will_it_buzz number
		(number % 5 == 0)
	end

end