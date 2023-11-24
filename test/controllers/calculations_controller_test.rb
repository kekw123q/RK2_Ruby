require 'test_helper'

class CalculationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get calculations_input_url
    assert_response :success
  end

  test 'should get result' do
    get calculations_result_url
    assert_response :success
  end
end
