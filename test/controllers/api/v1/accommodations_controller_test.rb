require "test_helper"

class API::V1::AccommodationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_accommodation = api_v1_accommodations(:one)
  end

  test "should get index" do
    get api_v1_accommodations_url, as: :json
    assert_response :success
  end

  test "should create api_v1_accommodation" do
    assert_difference("Api::V1::Accommodation.count") do
      post api_v1_accommodations_url, params: { api_v1_accommodation: { description: @api_v1_accommodation.description } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_accommodation" do
    get api_v1_accommodation_url(@api_v1_accommodation), as: :json
    assert_response :success
  end

  test "should update api_v1_accommodation" do
    patch api_v1_accommodation_url(@api_v1_accommodation), params: { api_v1_accommodation: { description: @api_v1_accommodation.description } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_accommodation" do
    assert_difference("Api::V1::Accommodation.count", -1) do
      delete api_v1_accommodation_url(@api_v1_accommodation), as: :json
    end

    assert_response :no_content
  end
end
