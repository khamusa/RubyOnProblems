class AnagramDictionary

	def initialize(filename)
		raise "Please specify filename" unless filename
		@filename = filename
		raise "The specified file does not exist" unless File.exists?(@filename)

		@dictionary = build_hash_dictionary @filename
	end

	def anagrams_for word
		@dictionary[cannonical_representation(word)]
	end

	private

	def build_hash_dictionary filename
		dict = {}
		File.foreach(filename) { |x| (dict[cannonical_representation(x)] ||= []) << clean_str(x) }
		dict
	end

	def cannonical_representation(word)
		word.downcase.scan(/\w/).sort.join('')
	end

	def clean_str word
		word.gsub(/[^\w]/, '')
	end
end