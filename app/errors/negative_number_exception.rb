class NegativeNumberException < StandardError
  def initialize(numbers)
    message = "negative numbers not allowed #{numbers.join(', ')}"
    super(message)
  end
end
