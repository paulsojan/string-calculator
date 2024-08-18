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
      check_for_negative_numbers(numbers_array)

      valid_numbers = numbers_array.select { |num| num < 1000 }
      valid_numbers.sum
    end

    def normalize_delimiters
      if input.start_with?('//')
        string, delimiter = extract_custom_delimiter
        return normalized_numbers(string, delimiter)
      end
      normalized_numbers(input, default_delimiter)
    end

    def extract_custom_delimiter
      delimiter_part, numbers_part = input.split("\n", 2)
      delimiter = delimiter_part.start_with?('//[') ? delimiter_part.scan(/\[(.*?)\]/).flatten.join : delimiter_part[2..]
      [numbers_part, delimiter]
    end

    def normalized_numbers(string, delimiter)
      string.gsub(delimiter, ' ')
    end

    def check_for_negative_numbers(numbers)
      negative_numbers = numbers.select { |num| num < 0 }

      unless negative_numbers.empty?
        raise NegativeNumberException, negative_numbers
      end
    end

    def default_delimiter
      /[,|\n]/
    end
end
