# bowling_spec.rb
require_relative '../src/01-strings'

shared_examples "palindrome_examples" do |proc|
	it "returns true for simple palindrome strings" do
		expect(proc.call("aabaa")).to be_true
		expect(proc.call("ana")).to be_true
		expect(proc.call("anna")).to be_true
		expect(proc.call("lkjjkllkjjkl")).to be_true
	end

	it "returns true for palindrome strings with different case" do
		expect(proc.call("aabAa")).to be_true
		expect(proc.call("anA")).to be_true
		expect(proc.call("anNA")).to be_true
		expect(proc.call("lKjJkllkjJkl")).to be_true
	end

	it "returns true for palindrome strings ignoring punctuation" do
		expect(proc.call("aab.Aa")).to be_true
		expect(proc.call("a1,n1A")).to be_true
		expect(proc.call("Rise to vote, sir!")).to be_true
		expect(proc.call("so cool! looc os!")).to be_true
	end

	it "returns false for non palindrome strings" do
		expect(proc.call("aabba")).to be_false
		expect(proc.call("anaa")).to be_false
		expect(proc.call("a1nn2a")).to be_false
		expect(proc.call("ljjkllkjjkl")).to be_false
		expect(proc.call("Rise not to vote, sir!")).to be_false
	end
end
describe String do
	describe 'palindrome strings' do 
		include_examples "palindrome_examples", Proc.new { |string| string.is_palindrome? }
		include_examples "palindrome_examples", Proc.new { |string| string.is_palindrome_2? }
		include_examples "palindrome_examples", Proc.new { |string| string.is_palindrome_3? }
	end

	describe 'anagram strings' do 
		shared_examples "anagram_examples" do |proc|

			before :all do 
				@dict = %w(pippo pluto cioccolato biscotto cavolo cavallo capelli capp2ello)
			end
			
			it "returns true for simple anagrams" do
				expect(proc.call("ppoip", @dict)).to be_true
				expect(proc.call("otulp", @dict)).to be_true
				expect(proc.call("ccociolato", @dict)).to be_true
				expect(proc.call("vacolo", @dict)).to be_true
				expect(proc.call("c2ppaello", @dict)).to be_true
			end

			it "returns false for non-anagrams" do
				expect(proc.call("pspoip", @dict)).to be_false
				expect(proc.call("otulzp", @dict)).to be_false
				expect(proc.call("ccociolat", @dict)).to be_false
				expect(proc.call("vaccolo", @dict)).to be_false
			end	

			it "returns true for different-case anagrams" do
				expect(proc.call("pPoip", @dict)).to be_true
				expect(proc.call("TULPO", @dict)).to be_true
				expect(proc.call("CIOCCLATOO", @dict)).to be_true
				expect(proc.call("COLOVA", @dict)).to be_true
			end			

		end

		include_examples "anagram_examples", Proc.new { |string, str_array| string.is_anagram?(str_array) }
		include_examples "anagram_examples", Proc.new { |string, str_array| string.is_anagram2?(str_array) }
	end
end