module ApiRescuable
  extend ActiveSupport::Concern

  included do
    rescue_from NegativeNumberException, with: :handle_negative_number_error
  end

  private

    def handle_negative_number_error(exception)
      render json: {error: exception.message}.to_json, status: :unprocessable_entity
    end
end
