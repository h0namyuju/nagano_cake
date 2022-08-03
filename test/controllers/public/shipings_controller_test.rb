require "test_helper"

class Public::ShipingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_shipings_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_shipings_edit_url
    assert_response :success
  end
end
