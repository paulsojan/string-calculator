class AdditionService
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def process
    compute_sum
  end

  private

    def compute_sum
      numbers_array = input.split(",").map(&:to_i)
      numbers_array.sum
    end
end
