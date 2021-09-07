require "test_helper"

class RealEstateAdControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get real_estate_ad_index_url
    assert_response :success
  end

  test "should get show" do
    get real_estate_ad_show_url
    assert_response :success
  end
end
