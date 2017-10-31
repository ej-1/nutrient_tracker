class Api::V1::EatenFoodsController < Api::V1::BaseController
  def index
    respond_with EatenFood.all
  end

  def create
    respond_with :api, :v1, EatenFood.create(eaten_food_params)
  end

  def destroy
    respond_with EatenFood.destroy(params[:id])
  end

  def update
    eaten_food = EatenFood.find(params["id"])
    eaten_food.update_attributes(eaten_food_params)
    respond_with eaten_food, json: eaten_food
  end

  private

  def eaten_food_params
    params.require(:eaten_food).permit(:name, :amount, :eaten_at)
  end
end
