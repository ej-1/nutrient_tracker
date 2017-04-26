class EatenFoodsController < ApplicationController
  before_action :set_eaten_food, only: [:show, :edit, :update, :destroy]

  # GET /eaten_foods
  # GET /eaten_foods.json
  def index
    @eaten_foods = EatenFood.all
  end

  # GET /eaten_foods/1
  # GET /eaten_foods/1.json
  def show
  end

  # GET /eaten_foods/new
  def new
    @eaten_food = EatenFood.new
  end

  # GET /eaten_foods/1/edit
  def edit
  end

  # POST /eaten_foods
  # POST /eaten_foods.json
  def create
    @eaten_food = EatenFood.new(eaten_food_params)

    respond_to do |format|
      if @eaten_food.save
        format.html { redirect_to @eaten_food, notice: 'Eaten food was successfully created.' }
        format.json { render :show, status: :created, location: @eaten_food }
      else
        format.html { render :new }
        format.json { render json: @eaten_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eaten_foods/1
  # PATCH/PUT /eaten_foods/1.json
  def update
    respond_to do |format|
      if @eaten_food.update(eaten_food_params)
        format.html { redirect_to @eaten_food, notice: 'Eaten food was successfully updated.' }
        format.json { render :show, status: :ok, location: @eaten_food }
      else
        format.html { render :edit }
        format.json { render json: @eaten_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eaten_foods/1
  # DELETE /eaten_foods/1.json
  def destroy
    @eaten_food.destroy
    respond_to do |format|
      format.html { redirect_to eaten_foods_url, notice: 'Eaten food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eaten_food
      @eaten_food = EatenFood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eaten_food_params
      params.require(:eaten_food).permit(:name, :amount)
    end
end
