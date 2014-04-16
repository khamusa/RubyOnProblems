require_relative '../src/04-word_frequencies'

describe WordFrequencies do
	it 'raises an error if no filename is supplied' do
		expect { WordFrequencies.new }.to raise_error
		expect { WordFrequencies.new false }.to raise_error
		expect { WordFrequencies.new nil }.to raise_error
		expect { WordFrequencies.new '' }.to raise_error
	end

	it 'raises an error if a non-existing filename is passed' do
		expect { WordFrequencies.new "bugue" }.to raise_error
	end

	it 'does not raise an error if the supplied file exists' do
		expect { WordFrequencies.new "data/just_text.txt" }.to_not raise_error
	end

	it 'returns 15 for the word "a" ' do
		wc = WordFrequencies.new "data/just_text.txt"
		expect(wc.count_for "a").to eq(15)
	end

	it 'returns 3 for the word "real" ' do
		wc = WordFrequencies.new "data/just_text.txt"
		expect(wc.count_for "real").to eq(3)
	end
end
