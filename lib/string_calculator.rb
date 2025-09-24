# lib/string_calculator.rb
class StringCalculator
  def add(numbers)
    raise ArgumentError, "Input must be a string" unless numbers.is_a?(String)
    return 0 if numbers.empty?

    delimiter = /,|\n/

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      custom_delimiter = header[2..]
      delimiter = Regexp.escape(custom_delimiter) # escape special chars for regex
    end

    # Sum any number of inputs, Split by comma or newline
    number_list =  numbers.split(/#{delimiter}/).map(&:to_i)
    number_list.sum
  end
end