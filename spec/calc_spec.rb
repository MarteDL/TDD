require 'rspec'
require './lib/calc'

describe 'Calc' do

  calc = Calc.new

  context 'when creating a calculator object' do
    it 'succeeds' do
      expect(calc).to be_kind_of(Calc)
    end
  end

  describe '#calculate' do
    context "given '5 + 5'" do
      it "returns '10'" do
        expect(calc.calculate('5 + 5')).to eql('10')
      end
    end

    context "given '5 + 0'" do
      it "returns '5'" do
        expect(calc.calculate('5 + 5')).to eql('10')
      end
    end

    context "given '5 - 4'" do
      it "returns '1'" do
        calc = Calc.new
        expect(calc.calculate('5 - 4')).to eql('1')
      end
    end

    context "given '5 * 4'" do
      it "returns '20'" do
        expect(calc.calculate('5 * 4')).to eql('20')
      end
    end

    context "given '20 / 4'" do
      it "returns '5'" do
        expect(calc.calculate('20 / 4')).to eql('5')
      end
    end

    context "given '5+5'" do
      it "returns '10'" do
        expect(calc.calculate('5+5')).to eql('10')
      end
    end

    context 'given a string with text' do
      it 'raises an error' do
        expect { calc.calculate('hello there') }.to raise_error(TypeError)
      end
    end

    context 'given an empty string' do
      it 'raises an error' do
        expect { calc.calculate('') }.to raise_error(TypeError)
      end
    end

    context 'given random characters' do
      it 'raises an error' do
        expect { calc.calculate('&*$%') }.to raise_error(TypeError)
      end
    end

    context 'given faulty input' do
      it 'raises an error' do
        expect { calc.calculate('234%*235') }.to raise_error(TypeError)
      end
    end

    context 'given floats' do
      it 'returns the correct result' do
        expect(calc.calculate('5.3+5.3')).to eql('10.6')
      end
    end

    context 'given a division that results in a float' do
      it 'returns a float' do
        expect(calc.calculate('100/3')).to eql('33.33')
      end
    end

    context "given '5+5+5'" do
      it "should return '15''" do
        expect(calc.calculate('5+5+5')).to eql('15')
      end
    end

    context "given '5+5-3'" do
      it "should return '7''" do
        expect(calc.calculate('5+5-3')).to eql('7')
      end
    end

    context "given '5+5-3-1'" do
      it "should return '6''" do
        expect(calc.calculate('5+5-3-1')).to eql('6')
      end
    end

    context "given '5.3+6-4+9.2-7.3+18.2+1'" do
      it "should return '28.4''" do
        expect(calc.calculate('5.3+6-4+9.2-7.3+18.2+1')).to eql('28.4')
      end
    end

    context "given '14-4.2+7+9-12-1.3+0.5'" do
      it "should return '13''" do
        expect(calc.calculate('14-4.2+7+9-12-1.3+0.5')).to eql('13')
      end
    end
  end
end
