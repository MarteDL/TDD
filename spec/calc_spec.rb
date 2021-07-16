require 'rspec'
require 'rspec-parameterized'
require './lib/calc'

describe 'Calc' do

  let(:calc) { Calc.new }

  describe '#calculate result' do
    where(:string, :result) do
      [
        ['5 + 5', '10'],
        ['5 - 4', '1'],
        ['5 * 4', '20'],
        ['20 / 4', '5'],
        ['5.3+5.3', '10.6'],
        ['100/3', '33.33'],
        ['5+5+5', '15'],
        ['5+5-3', '7'],
        ['5+5-3-1', '6'],
        ['5.3+6-4+9.2-7.3+18.2+1', '28.4'],
        ['14-4.2+7+9-12-1.3+0.5', '13']
      ]
    end

    with_them do
      it 'should return the result' do
        expect(calc.calculate(string)).to eql(result)
      end
    end

    describe '#calculate input validation' do
      where(:string, :error) do
        [
          ['hello there', InvalidArgumentError],
          ['', InvalidArgumentError],
          ['&*$%', InvalidArgumentError],
          ['234%*235', InvalidArgumentError],
          ['234+-45,5*4/-6', InvalidArgumentError]
        ]
      end

      with_them do
        it 'raises an InvalidArgumentError' do
          expect { calc.calculate(string) }.to raise_error(error)
        end
      end
    end
  end
end
