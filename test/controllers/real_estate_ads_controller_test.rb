require "test_helper"

class RealEstateAdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @real_estate_ad = real_estate_ads(:one)
  end

  test "should get index" do
    get real_estate_ads_url, as: :json
    assert_response :success
  end

  test "should create real_estate_ad" do
    assert_difference('RealEstateAd.count') do
      post real_estate_ads_url, params: { real_estate_ad: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show real_estate_ad" do
    get real_estate_ad_url(@real_estate_ad), as: :json
    assert_response :success
  end

  test "should update real_estate_ad" do
    patch real_estate_ad_url(@real_estate_ad), params: { real_estate_ad: {  } }, as: :json
    assert_response 200
  end

  test "should destroy real_estate_ad" do
    assert_difference('RealEstateAd.count', -1) do
      delete real_estate_ad_url(@real_estate_ad), as: :json
    end

    assert_response 204
  end
end
