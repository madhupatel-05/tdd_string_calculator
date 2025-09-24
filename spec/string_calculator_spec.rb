require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    let(:calc) { StringCalculator.new }

    context 'when input is empty string' do
      it 'returns 0' do
        expect(calc.add("")).to eq(0)
      end
    end

    context 'when input is not a string' do
      it 'raises ArgumentError for array input' do
        expect { calc.add([""]) }.to raise_error(ArgumentError, "Input must be a string")
      end

      it 'raises ArgumentError for integer input' do
        expect { calc.add(5) }.to raise_error(ArgumentError, "Input must be a string")
      end

      it 'raises ArgumentError for nil input' do
        expect { calc.add(nil) }.to raise_error(ArgumentError, "Input must be a string")
      end
    end

    context 'when input is a single number' do
      it 'returns the number as integer' do
        expect(calc.add("1")).to eq(1)
        expect(calc.add("42")).to eq(42)
      end
    end

    context 'when input has multiple numbers' do
      it 'returns the sum of the numbers' do
        expect(calc.add("1,2")).to eq(3)
        expect(calc.add("4,5,6")).to eq(15)
        expect(calc.add("10,20,30,40")).to eq(100)
      end
    end

    context 'when input contains newlines' do
      it 'returns the sum for numbers separated by commas or newlines' do
        expect(calc.add("1\n2,3")).to eq(6)
        expect(calc.add("4\n5\n6")).to eq(15)
        expect(calc.add("10,20\n30,10")).to eq(70)
      end
    end

    context 'when input contains a custom delimiter' do
      it 'returns the sum of numbers with the custom delimiter' do
        expect(calc.add("//;\n1;2")).to eq(3)
        expect(calc.add("//*\n4*5*6")).to eq(15)
        expect(calc.add("//.\n10.20.30")).to eq(60)
      end
    end

    context 'when input contains negative numbers' do
      it 'raises an error for a single negative number' do
        expect { calc.add("1,-2,3") }.to raise_error(
          ArgumentError,
          "negative numbers not allowed -2"
        )
      end

      it 'raises an error listing all negative numbers' do
        expect { calc.add("-1,-2,3,-4") }.to raise_error(
          ArgumentError,
          "negative numbers not allowed -1,-2,-4"
        )
      end
    end
  end
end
