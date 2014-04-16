=begin
Let's write a function (or a pool of functions) that given a quite large text (over than 2000 words) counts how frequent each word occurs in the text.
The text is read from a file (look at the pervasive module in the manual) and it is a real text with punctuation (i.e., commas, semicolons, ...) that should be counted.
Note that words with different case should be considered the same.
=end

class WordFrequencies
	def initialize(filename)
		raise "Please supply a filename" unless filename && filename != ''
		raise "The supplied file does not exist" unless File.exists?(filename)
		@counter = Hash.new(0)
		process_file filename
	end

	def count_for word
		@counter[word]
	end

	private
	def process_file filename
		File.foreach filename do |line|
			line.scan(/\w+/).each do |word|
				@counter[word.downcase] = @counter[word.downcase]+1
			end
		end
	end
end