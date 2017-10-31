require 'test_helper'

class EatenFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eaten_food = eaten_foods(:one)

    @eaten_foods_for_single_day = {
      'Kyckling bröstfilé u skinn ugnsstekt'=>
        {
          :id=>1,
          :energy=>134.0,
          :carbohydrates=>0.0,
          :fat=>2.5,
          :protein=>27.47,
          :fiber=>0.0,
          :water=>68.13,
          :alcohol=>0.0,
          :ash=>1.9,
          :sucrose=>0.04,
          :whole_grains_total=>0.0,
          :sugar_types=>0.0,
          :epa=>0.01,
          :dpa=>0.01,
          :dha=>0.02,
          :retinol=>12.1,
          :vitamin_a=>12.1,
          :b_carotene=>2.0,
          :vitamin_d=>0.63,
          :vitamin_e=>0.8,
          :vitamin_k=>0.19,
          :riboflavin=>0.13,
          :vitamin_c=>0.0,
          :niacin=>13.1,
          :niacin_equivalents=>18.1,
          :vitamin_b6=>0.18,
          :folate=>20.1,
          :phosphorus=>251.0,
          :iron=>0.26,
          :calcium=>6.0,
          :potassium=>361.0,
          :magnesium=>33.0,
          :sodium=>0.79,
          :selenium=>16.0,
          :zinc=>0.83,
          :waste=>0.0
        },
      'Broccoli'=>
        {
          :id=>2,
          :energy=>134.0,
          :carbohydrates=>0.0,
          :fat=>2.5,
          :protein=>27.47,
          :fiber=>0.0,
          :water=>68.13,
          :alcohol=>0.0,
          :ash=>1.9,
          :sucrose=>0.04,
          :whole_grains_total=>0.0,
          :sugar_types=>0.0,
          :epa=>0.01,
          :dpa=>0.01,
          :dha=>0.02,
          :retinol=>12.1,
          :vitamin_a=>12.1,
          :b_carotene=>2.0,
          :vitamin_d=>0.63,
          :vitamin_e=>0.8,
          :vitamin_k=>0.19,
          :riboflavin=>0.13,
          :vitamin_c=>0.0,
          :niacin=>13.1,
          :niacin_equivalents=>18.1,
          :vitamin_b6=>0.18,
          :folate=>20.1,
          :phosphorus=>251.0,
          :iron=>0.26,
          :calcium=>6.0,
          :potassium=>361.0,
          :magnesium=>33.0,
          :sodium=>0.79,
          :selenium=>16.0,
          :zinc=>0.83,
          :waste=>0.0
        }
    }

    @daily_sums_of_nutrients = {
      :energy=>134.0,
      :carbohydrates=>0.0,
      :fat=>2.5,
      :protein=>27.47,
      :fiber=>0.0,
      :water=>68.13,
      :alcohol=>0.0,
      :ash=>1.9,
      :sucrose=>0.04,
      :whole_grains_total=>0.0,
      :sugar_types=>0.0,
      :epa=>0.01,
      :dpa=>0.01,
      :dha=>0.02,
      :retinol=>12.1,
      :vitamin_a=>12.1,
      :b_carotene=>2.0,
      :vitamin_d=>0.63,
      :vitamin_e=>0.8,
      :vitamin_k=>0.19,
      :riboflavin=>0.13,
      :vitamin_c=>0.0,
      :niacin=>13.1,
      :niacin_equivalents=>18.1,
      :vitamin_b6=>0.18,
      :folate=>20.1,
      :phosphorus=>251.0,
      :iron=>0.26,
      :calcium=>6.0,
      :potassium=>361.0,
      :magnesium=>33.0,
      :sodium=>0.79,
      :selenium=>16.0,
      :zinc=>0.83,
      :waste=>0.0
    }

    @daily_percentage_of_rdi = {
      :energy=>134.0,
      :carbohydrates=>0.0,
      :fat=>2.5,
      :protein=>27.47,
      :fiber=>0.0,
      :water=>68.13,
      :alcohol=>0.0,
      :ash=>1.9,
      :sucrose=>0.04,
      :whole_grains_total=>0.0,
      :sugar_types=>0.0,
      :epa=>0.01,
      :dpa=>0.01,
      :dha=>0.02,
      :retinol=>12.1,
      :vitamin_a=>12.1,
      :b_carotene=>2.0,
      :vitamin_d=>0.63,
      :vitamin_e=>0.8,
      :vitamin_k=>0.19,
      :riboflavin=>0.13,
      :vitamin_c=>0.0,
      :niacin=>13.1,
      :niacin_equivalents=>18.1,
      :vitamin_b6=>0.18,
      :folate=>20.1,
      :phosphorus=>251.0,
      :iron=>0.26,
      :calcium=>6.0,
      :potassium=>361.0,
      :magnesium=>33.0,
      :sodium=>0.79,
      :selenium=>16.0,
      :zinc=>0.83,
      :waste=>0.0
    },

    @eaten_foods_with_dates_ids_nutrients_and_sums = {
      '2017-05-01T00:00:00+00:00'=>
        {
          :eaten_foods => @eaten_foods_for_single_day,
          :daily_sums_of_nutrients => @daily_sums_of_nutrients,
          :daily_percentage_of_rdi => @daily_percentage_of_rdi,
        },
      '2017-05-02T00:00:00+00:00'=>
        {
          :eaten_foods => @eaten_foods_for_single_day,
          :daily_sums_of_nutrients => @daily_sums_of_nutrients,
          :daily_percentage_of_rdi => @daily_percentage_of_rdi,
        }
    }

    #binding.pry
  end

  test "eaten_foods_with_dates_ids_nutrients_and_sums" do
    get eaten_foods_url
    #@eaten_foods_with_dates_ids_nutrients_and_sums = @eaten_foods_with_dates_ids_nutrients_and_sums
    #assert_response :success
    #binding.pry
    assert_redirected_to eaten_fods_path(assigns(:test_variable))
    #puts @_response
  end

=begin

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
=end
end
