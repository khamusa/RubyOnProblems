# bowling_spec.rb
require_relative '../src/03-fizz_buzzer'

describe FizzBuzzer do
	it "instantiantes a FizzBuzzer" do
		expect { FizzBuzzer.new }.to_not raise_error
	end

	it "gives the correct sequence for number 1" do
		fz = FizzBuzzer.new
		expect(fz.fizz_to 1).to eq("1")
	end

	it "gives the fizz instead of multiples of three" do
		fz = FizzBuzzer.new
		expect(fz.fizz_to 6).to start_with("1 2 fizz 4")
		expect(fz.fizz_to 9).to end_with("fizz")
		expect(fz.fizz_to 12).to end_with("fizz")
		expect(fz.fizz_to 99).to end_with("fizz")
	end

	it "gives the buzz instead of multiples of five wich are not multiple of three" do
		fz = FizzBuzzer.new
		expect(fz.fizz_to 5).to eq("1 2 fizz 4 buzz")
		expect(fz.fizz_to 10).to end_with("fizz buzz")
		expect(fz.fizz_to 20).to end_with("19 buzz")
		expect(fz.fizz_to 110).to end_with("109 buzz")
	end

	it "gives fizzbuzz for multiples of both three and five" do
		fz = FizzBuzzer.new
		expect(fz.fizz_to 15).to end_with("14 fizzbuzz")
		expect(fz.fizz_to 30).to end_with("29 fizzbuzz")
		expect(fz.fizz_to 60).to end_with("59 fizzbuzz")
	end
end