class Calc
  MATH_SYMBOLS = %w[+ - * /].freeze

  def calculate(string)
    raise TypeError if contains_any_letters(string) || string.empty?

    string_without_spaces = string.split(' ').join
    math_symbol = string_without_spaces.split(//) & MATH_SYMBOLS

    numbers_as_strings = string_without_spaces.split(math_symbol.first)

    numbers = numbers_as_strings.map(&:to_i)
    numbers.inject(math_symbol.first.to_s)
  end

  def contains_any_letters(string)
    lowercase = ('a'..'z')
    uppercase = ('A'..'Z')
    string.each_char.any? { |char| lowercase.cover?(char) || uppercase.cover?(char) }
  end
end
