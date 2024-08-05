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
      numbers_array = normalized_numbers.split.map(&:to_i)
      numbers_array.sum
    end

    def normalized_numbers
      input.gsub(/[,|\n]/, ' ')
    end
end
