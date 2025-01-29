class StringCalculator
  DELIMITERS = [' ', "//", "\n", ";", "|", '%', '*']

  def self.add(number_string)
    # replaced all delimiters with comma
    DELIMITERS.each { |delimiter| number_string.gsub!(delimiter, ',') }

    numbers = number_string.split(',').collect(&:to_i).sort
    if numbers.present? && numbers.first.negative?
      negative_numbers = numbers.take_while {|number| number.negative? }

      raise NegativeNumberFound.new("negative numbers not allowed: #{ negative_numbers.join(', ') }")
    end

    # remove numbers greater than 1000
    numbers = numbers.take_while{ |number| number <= 1000 }

    numbers.sum
  end
end
