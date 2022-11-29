require "test_helper"

class API::V1::RentalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_rental = api_v1_rentals(:one)
  end

  test "should get index" do
    get api_v1_rentals_url, as: :json
    assert_response :success
  end

  test "should create api_v1_rental" do
    assert_difference("Api::V1::Rental.count") do
      post api_v1_rentals_url, params: { api_v1_rental: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_rental" do
    get api_v1_rental_url(@api_v1_rental), as: :json
    assert_response :success
  end

  test "should update api_v1_rental" do
    patch api_v1_rental_url(@api_v1_rental), params: { api_v1_rental: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_rental" do
    assert_difference("Api::V1::Rental.count", -1) do
      delete api_v1_rental_url(@api_v1_rental), as: :json
    end

    assert_response :no_content
  end
end
