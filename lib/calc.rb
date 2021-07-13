class Calc
  MATH_SYMBOLS = %w[+ - * /].freeze
  INPUT_REGEX = %r{^(\d+(\.\d+)?[\+\-\*\/]{1}\d+(\.\d+)?)([\+\-\*\/]{1}\d+(\.\d+)?)*$}.freeze

  def calculate(string)
    string_without_spaces = string.split(' ').join

    raise TypeError unless valid?(string_without_spaces)

    string_in_partials = INPUT_REGEX.match(string_without_spaces).captures
    calculation_of_partials(string_in_partials)
  end

  def valid?(string)
    return false if string.empty?

    string.match(INPUT_REGEX)
  end

  def format_to_string(result)
    '%g' % ('%.2f' % result)
  end

  def calculation_of_partials(partials)
    clean_up(partials)

    partials.inject('') do |result, partial|
      result << partial
      math_symbol = get_math_symbol(result)
      numbers_as_strings = result.split(math_symbol.first)

      numbers = numbers_as_strings.map(&:to_f)
      result = format_to_string(numbers.inject(math_symbol.first.to_s))
      result
    end
  end

  def get_math_symbol(string)
    string.split(//) & MATH_SYMBOLS
  end

  def clean_up(match_partials)
    match_partials.compact!
    match_partials.filter { |partial| !get_math_symbol(partial).empty? }
  end
end
