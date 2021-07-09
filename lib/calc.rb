class Calc
  def calculate(string)
    math_symbol = string.split(' ')[1]
    numbers_as_strings = string.split(math_symbol)
    numbers = numbers_as_strings.map(&:to_i)
    numbers.inject(math_symbol.to_s)
  end
end
