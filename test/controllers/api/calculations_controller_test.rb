# frozen_string_literal: true

require 'test_helper'

class CalculationsControllerTest < ActionDispatch::IntegrationTest
  def test_test_should_perform_addition
    post api_calculations_path, params: {calculation: {input: "//[***]\n1***2***4" }}

    assert_response :success
    response = @response.parsed_body
    assert_equal 7, response["sum"]
  end

  def test_should_throw_error_for_input_with_negative_number
    post api_calculations_path, params: { calculation: { input: "//;\n-1;2;-4" } }
    assert_response :unprocessable_entity

    response_json = @response.parsed_body
    assert_equal "negative numbers not allowed -1, -4", response_json['error']
  end
end
