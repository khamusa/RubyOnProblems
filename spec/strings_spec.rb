# bowling_spec.rb
require_relative '../src/01-strings'

describe String do
	describe 'is_palindrome?' do 
		it "returns true for simple palindrome strings" do
			expect("aabaa".is_palindrome?).to be_true
			expect("ana".is_palindrome?).to be_true
			expect("anna".is_palindrome?).to be_true
			expect("lkjjkllkjjkl".is_palindrome?).to be_true
		end

		it "returns true for palindrome strings with different case" do
			expect("aabAa".is_palindrome?).to be_true
			expect("anA".is_palindrome?).to be_true
			expect("anNA".is_palindrome?).to be_true
			expect("lKjJkllkjJkl".is_palindrome?).to be_true
		end

		it "returns true for palindrome strings ignoring punctuation" do
			expect("aab.Aa".is_palindrome?).to be_true
			expect("a,nA".is_palindrome?).to be_true
			expect("Rise to vote, sir!".is_palindrome?).to be_true
			expect("so cool! looc os!".is_palindrome?).to be_true
		end
	end
end