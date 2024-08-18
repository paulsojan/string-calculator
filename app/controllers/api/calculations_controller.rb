class Api::CalculationsController < ApplicationController
  def create
    result = AdditionService.new(calculations_params[:input]).process
    render json: {sum: result}
  end

  private

    def calculations_params
      params.require(:calculation).permit(:input)
    end
end
