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
	describe 'is_palindrome?' do 
		include_examples "palindrome_examples", Proc.new { |string| string.is_palindrome? }
	end
	describe 'is_palindrome_2?' do 
		include_examples "palindrome_examples", Proc.new { |string| string.is_palindrome_2? }
	end
end