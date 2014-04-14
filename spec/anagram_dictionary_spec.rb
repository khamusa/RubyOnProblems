require_relative '../src/02-anagram_dictionary'

describe AnagramDictionary do
	it "raises an error if no filename is specified" do
		expect { AnagramDictionary.new() }.to raise_error
		expect { AnagramDictionary.new(nil) }.to raise_error
		expect { AnagramDictionary.new(false) }.to raise_error
	end 

	it "raises a file not found error if the specified file does not exist" do
		expect { AnagramDictionary.new('pippoplutomickey') }.to raise_error
	end

	it "finds anagrams if supplied with a valid dictionary" do
		expect { @dict = AnagramDictionary.new("data/dictionary.txt") }.to_not raise_error
		expect(@dict.anagrams_for "aanbonds").to eq(["abandons"])
		expect(@dict.anagrams_for "ductorab").to eq(["abductor"])
		expect(@dict.anagrams_for "bamsa").to eq(["samba"])
		expect(@dict.anagrams_for "maslab").to eq(["balsam"])
		expect(@dict.anagrams_for "sample").to eq(["maples", "sample"])
	end
end