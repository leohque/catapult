require 'test_helper'

class ArtOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get art_orders_destroy_url
    assert_response :success
  end

end
