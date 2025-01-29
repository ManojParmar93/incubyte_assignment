require 'rails_helper'

RSpec.describe StringCalculator do
  describe 'add' do
    it 'should respond to add method' do
      expect(StringCalculator.respond_to?(:add)).to be_truthy
    end
  end
end
