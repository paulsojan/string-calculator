class AdditionService
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def process
    return 0 if input.empty?

    compute_sum
  end

  private

    def compute_sum
      numbers_array = normalize_delimiters.split.map(&:to_i)
      negative_numbers = numbers_array.select { |num| num < 0 }

      unless negative_numbers.empty?
        raise NegativeNumberException, negative_numbers
      end
      numbers_array.sum
    end

    def normalize_delimiters
      if input.start_with?('//')
        string, delimiter = extract_custom_delimiter
        return normalized_numbers(string, delimiter)
      end
      normalized_numbers(input, default_delimiter)
    end

    def extract_custom_delimiter
      new_input = input.split("\n", 2)
      delimiter = new_input[0][2..]
      [new_input[1], delimiter]
    end

    def normalized_numbers(string, delimiter)
      string.gsub(delimiter, ' ')
    end

    def default_delimiter
      /[,|\n]/
    end
end
