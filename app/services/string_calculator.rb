class StringCalculator
  DELIMITERS = [' ', "//", "\n", ";", "|"]

  def self.add(numbers)
    # replaced all delimiters with comma
    DELIMITERS.each { |delimiter| numbers.gsub!(delimiter, ',') }

    numbers.split(',').collect(&:to_i).sum
  end
end
