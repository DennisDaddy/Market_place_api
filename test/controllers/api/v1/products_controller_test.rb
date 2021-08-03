require 'test_helper'

class Api::V1::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should show product" do
    get api_v1_product_url(@product), as: :json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_equal @product.title, json_response['title']
  end

  test 'should update product' do
    patch api_v1_product_url(@product), 
          params: { product: { title: @product.title } }, 
          headers: { Authorization: JsonWebToken.encode(user_id:
   @product.user_id) }, as: :json
    assert_response :success
  end

  test 'should forbid update product' do
    patch api_v1_product_url(@product),
    params: { product: { title: @product.title } },
    headers: { Authorization: JsonWebToken.encode(user_id:
    users(:two).id) }, as: :json
    assert_response :forbidden
  end
  

end
