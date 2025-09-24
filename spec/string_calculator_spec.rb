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
  end
end