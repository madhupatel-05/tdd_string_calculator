# lib/string_calculator.rb
class StringCalculator
  def add(numbers)
    raise ArgumentError, "Input must be a string" unless numbers.is_a?(String)
    return 0 if numbers.empty?

    # Sum any number of inputs, Split by comma or newline
    number_list = numbers.split(/,|\n/).map(&:to_i)
    number_list.sum
  end
end