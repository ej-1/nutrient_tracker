require 'test_helper'

class EatenFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eaten_food = eaten_foods(:one)
  end

  test "should get index" do
    get eaten_foods_url
    assert_response :success
  end

  test "should get new" do
    get new_eaten_food_url
    assert_response :success
  end

  test "should create eaten_food" do
    assert_difference('EatenFood.count') do
      post eaten_foods_url, params: { eaten_food: { amount: @eaten_food.amount, name: @eaten_food.name } }
    end

    assert_redirected_to eaten_food_url(EatenFood.last)
  end

  test "should show eaten_food" do
    get eaten_food_url(@eaten_food)
    assert_response :success
  end

  test "should get edit" do
    get edit_eaten_food_url(@eaten_food)
    assert_response :success
  end

  test "should update eaten_food" do
    patch eaten_food_url(@eaten_food), params: { eaten_food: { amount: @eaten_food.amount, name: @eaten_food.name } }
    assert_redirected_to eaten_food_url(@eaten_food)
  end

  test "should destroy eaten_food" do
    assert_difference('EatenFood.count', -1) do
      delete eaten_food_url(@eaten_food)
    end

    assert_redirected_to eaten_foods_url
  end
end
