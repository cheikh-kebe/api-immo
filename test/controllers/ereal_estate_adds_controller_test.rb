require "test_helper"

class ErealEstateAddsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ereal_estate_add = ereal_estate_adds(:one)
  end

  test "should get index" do
    get ereal_estate_adds_url, as: :json
    assert_response :success
  end

  test "should create ereal_estate_add" do
    assert_difference('ErealEstateAdd.count') do
      post ereal_estate_adds_url, params: { ereal_estate_add: { description: @ereal_estate_add.description, price: @ereal_estate_add.price, title: @ereal_estate_add.title } }, as: :json
    end

    assert_response 201
  end

  test "should show ereal_estate_add" do
    get ereal_estate_add_url(@ereal_estate_add), as: :json
    assert_response :success
  end

  test "should update ereal_estate_add" do
    patch ereal_estate_add_url(@ereal_estate_add), params: { ereal_estate_add: { description: @ereal_estate_add.description, price: @ereal_estate_add.price, title: @ereal_estate_add.title } }, as: :json
    assert_response 200
  end

  test "should destroy ereal_estate_add" do
    assert_difference('ErealEstateAdd.count', -1) do
      delete ereal_estate_add_url(@ereal_estate_add), as: :json
    end

    assert_response 204
  end
end
