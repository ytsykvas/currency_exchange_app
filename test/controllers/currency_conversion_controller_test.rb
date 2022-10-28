require "test_helper"

class CurrencyConversionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get currency_conversion_index_url
    assert_response :success
  end

  test "should get conversion" do
    get currency_conversion_conversion_url
    assert_response :success
  end
end
