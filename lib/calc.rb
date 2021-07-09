class Calc
  def calculate(string)
    numbers_as_strings = string.split('+')
    numbers = numbers_as_strings.map(&:to_i)
    numbers.inject(:+)
  end
end
