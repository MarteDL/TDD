require 'rspec'
require './lib/calc'

describe 'Calc' do
  context 'when creating a calculator object' do
    it 'succeeds' do
      calculator = Calc.new
      expect(calculator.class).to eql(Calc)
    end
  end
end

describe 'Calculate' do
  context "given '5 + 5'" do
    it "returns '10'" do
      calc = Calc.new
      expect(calc.calculate('5 + 5')).to eql(10)
    end
  end

  context "given '5 + 0'" do
    it "returns '5'" do
      calc = Calc.new
      expect(calc.calculate('5 + 5')).to eql(10)
    end
  end
end