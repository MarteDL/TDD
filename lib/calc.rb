class Calc
  MATH_SYMBOLS = %w[+ - * /].freeze

  def calculate(string)
    string_without_spaces = string.split(' ').join

    raise TypeError unless valid?(string_without_spaces)

    math_symbol = string_without_spaces.split(//) & MATH_SYMBOLS
    numbers_as_strings = string_without_spaces.split(math_symbol.first)

    numbers = numbers_as_strings.map(&:to_i)
    numbers.inject(math_symbol.first.to_s)
  end

  def valid?(string)
    return false if string.empty?

    regex = %r{^\d+[\+\-\*\/]{1}\d+$}

    string.match(regex)
  end
end
