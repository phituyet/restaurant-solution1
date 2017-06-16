require 'test_helper'

class FoodItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get food_items_show_url
    assert_response :success
  end

end
