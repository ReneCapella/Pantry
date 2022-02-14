require "test_helper"

class PantriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pantry = pantries(:one)
  end

  test "should get index" do
    get pantries_url
    assert_response :success
  end

  test "should get new" do
    get new_pantry_url
    assert_response :success
  end

  test "should create pantry" do
    assert_difference("Pantry.count") do
      post pantries_url, params: { pantry: {  } }
    end

    assert_redirected_to pantry_url(Pantry.last)
  end

  test "should show pantry" do
    get pantry_url(@pantry)
    assert_response :success
  end

  test "should get edit" do
    get edit_pantry_url(@pantry)
    assert_response :success
  end

  test "should update pantry" do
    patch pantry_url(@pantry), params: { pantry: {  } }
    assert_redirected_to pantry_url(@pantry)
  end

  test "should destroy pantry" do
    assert_difference("Pantry.count", -1) do
      delete pantry_url(@pantry)
    end

    assert_redirected_to pantries_url
  end
end
