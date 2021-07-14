class Calc
  MATH_SYMBOLS = %w[+ - * /].freeze

  REGEXES = {
    validation: %r{^(\d+(\.\d+)?[\+\-\*\/]{1}\d+(\.\d+)?)([\+\-\*\/]{1}\d+(\.\d+)?)*$},
    first_operation: %r{^(?'first_operation'\d+(\.\d+)?[\+\-\*\/]{1}\d+(\.\d+)?)},
    symbol_and_number: %r{[\+\-\*\/]{1}\d+(?>\.\d+)?}
  }.freeze

  def calculate(string)
    clean_string = string.split(' ').join
    raise TypeError unless valid?(clean_string)

    match_data_object = clean_string.match(REGEXES[:first_operation])
    first_operation = match_data_object[:first_operation]

    remainder_of_string = strip_first_operation_from(clean_string, first_operation)

    array_of_operations = get_numbers_and_math_symbols_from(remainder_of_string)
    result_first_operation = calculate_operation(first_operation)

    calculate_total(array_of_operations, result_first_operation)
  end

  def valid?(string)
    return false if string.empty?

    string.match(REGEXES[:validation])
  end

  def format_to_string(result)
    '%g' % ('%.2f' % result)
  end

  def get_math_symbol(string)
    string.split(//) & MATH_SYMBOLS
  end

  def calculate_operation(operation)
    math_symbol = get_math_symbol(operation)
    numbers_as_strings = operation.split(math_symbol.first)

    numbers = numbers_as_strings.map(&:to_f)
    format_to_string(numbers.inject(math_symbol.first.to_s))
  end

  def strip_first_operation_from(string, first_operation)
    number_of_characters = first_operation.size
    string.slice!(0, number_of_characters)
    string
  end

  def get_numbers_and_math_symbols_from(remainder_of_string)
    remainder_of_string.scan(REGEXES[:symbol_and_number])
  end

  def calculate_total(remainder_array, integer)
    remainder_array.inject(integer.to_s) do |result, operation|
      result << operation
      result = calculate_operation(result)
      result
    end
  end
end