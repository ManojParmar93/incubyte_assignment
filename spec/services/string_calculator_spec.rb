require 'rails_helper'

RSpec.describe StringCalculator do
  describe 'add' do
    it 'should respond to add method' do
      expect(StringCalculator.respond_to?(:add)).to be_truthy
    end

    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it 'returns the sum of two numbers' do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    it 'handles new lines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
      expect(StringCalculator.add("//|\n1|2|3")).to eq(6)
    end

    it 'add method to handle any amount of numbers' do
      numbers = (1..999999).to_a.join(',')
      expect(StringCalculator.add(numbers)).to eq(500500)
    end

    it 'raises an exception for negative numbers' do
      expect { StringCalculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
    end

    it 'includes all negative numbers in the exception message' do
      expect { StringCalculator.add("1,-2,-3,4") }.to raise_error("negative numbers not allowed: -3, -2")
    end

    it 'Numbers bigger than 1000 should be ignored' do
      expect(StringCalculator.add("1,1002")).to eq(1)
    end

    it 'Delimiters can be of any length' do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'Allow multiple delimiters' do
      expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it 'can also handle multiple delimiters with length longer than one char' do
      expect(StringCalculator.add("//[***]\n1||||||||||||||||2***3")).to eq(6)
    end
  end
end
