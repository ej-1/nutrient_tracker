class EatenFoodsController < ApplicationController
  before_action :set_eaten_food, only: [:show, :edit, :update, :destroy]

  # GET /eaten_foods
  # GET /eaten_foods.json
  def index
    @eaten_foods = EatenFood.all

    # THE NUTRIENTS ATTRIBUTES TITLE
    @eaten_foods_attributes = Foodtype.column_names

    # THE NUTRIENTS PER DAY WITH NAMW
    @eaten_foods_per_dates = get_eaten_foods_grouped_by_day

    # SUM PER DAY
    #@nutrient_sums_per_day = nutrient_sums_per_day(@eaten_foods_per_dates)

    # RECOMMENDED DAILY INTAKE
    #recommended_daily_intake

    # RECOMMENDED DAILY INTAKE
    #@percentages_of_rdi_achieved_per_day = percentages_of_rdi_achieved_grouped_by_day(@eaten_foods_per_dates).flatten

=begin
    EatenFood.all.each do |eaten_food| # Calculate total consumed for the day.
      eaten_food.attributes.each do |attribute, value|
        eaten_food.attribute
        @total << attribute
        @total << value
      end
    end
=end
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

    convert_nil_to_zero(eaten_food_params['amount'])
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
    respond_to do |format|eaten_food_params['eaten_at']
      params[:eaten_food][:eaten_at] = DateTime.strptime(eaten_food_params['eaten_at'],'%m/%d/%Y')
      name = {"name"=>params[:name]}
      eaten_food_params_two = eaten_food_params.merge(name)
      if @eaten_food.update(eaten_food_params_two)
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
      params.require(:eaten_food).permit(:name, :amount, :eaten_at)
    end

    #def get_eaten_food_during_selected_period
    #  EatenFood.where(:eaten_food)
    #end

    def get_eaten_foods_grouped_by_day
      @eaten_foods_grouped_by_day = []
      dates_for_eaten_foods.each do |date, count_of_eaten_foods|
        converted_date = convert_date(date)
        #can this even be empty???
        unless eaten_foods_on_a_single_day(converted_date).nil?# || eaten_foods_on_a_single_day(converted_date).&empty?
          eaten_food_hash = {}
          eaten_food_hash[:date] = converted_date
          eaten_food_hash[:eaten_foods] = eaten_foods_on_a_single_day_with_nutrients(converted_date)
          @eaten_foods_grouped_by_day << eaten_food_hash
          eaten_food_hash = {}
        end
      end
      #binding.pry
      @eaten_foods_grouped_by_day
    end

=begin
    def get_eaten_food_types_grouped_by_day
      @eaten_foods_grouped_by_day = []
      dates_for_eaten_foods.each do |date, count_of_eaten_foods|
        converted_date = convert_date(date)
        #can this even be empty???
        unless eaten_foods_on_a_single_day(converted_date).nil?# || eaten_foods_on_a_single_day(converted_date).&empty?
          @eaten_foods_grouped_by_day << eaten_foods_on_a_single_day(converted_date)
          #binding.pry
        end
      end
      @eaten_foods_grouped_by_day
      #binding.pry
    end

    def nutrient_sums_per_day(eaten_foods_grouped_by_day) # PER DAY
      @sums = []
      eaten_foods_grouped_by_day.each do |eaten_foods_on_a_single_day|
        #binding.pry # 2
        @sums << sum_up_nutrient_types(eaten_foods_on_a_single_day[:eaten_foods])
      end
    end

    def sum_up_nutrient_types(eaten_foods_on_a_single_day) # PER MEAL
      #binding.pry # 1
      if eaten_foods_on_a_single_day.count == 0
        #binding.pry
        eaten_food_type = get_many_food_types_for(eaten_foods_on_a_single_day)
        remove_ids_names_timestamps(eaten_food_type.attributes)
        @sums = {}
        food_type_name_and_nutrient_names.each do |nutrient_name, value|
          if is_number?(value)
            #binding.pry
            values_for_single_nutrient_type = convert_nil_to_zero(eaten_food_type[nutrient_name])
            @sums[:"#{nutrient_name}"] = values_for_single_nutrient_type
          end
        end
        return @sums
        #binding.pry
      else
        #binding.pry
        eaten_food_types = get_many_food_types_for(eaten_foods_on_a_single_day)
        eaten_food_types = eaten_food_types.map do |eaten_food_type|
          remove_ids_names_timestamps(eaten_food_type)
        end
        @sums = []
        #binding.pry
        food_type_name_and_nutrient_names.each do |nutrient_name, value|
          if is_number?(value)
            values_for_single_nutrient_type = eaten_food_types.map { |eaten_food_type| convert_nil_to_zero(eaten_food_type[nutrient_name]) }
            @sums << nutrient_name
            @sums << sum_of(values_for_single_nutrient_type)
          end
        end
        return @sums
      end
    end
=end
    def get_single_food_types_for(eaten_food) # {foodname: name, nutrient: amount, nutrient: amount}
      food = Foodtype.where(name: eaten_food).first.as_json
      food.delete('id')
      food.delete('created_at')
      food.delete('updated_at')
      return food
    end

    def get_many_food_types_for(eaten_foods)
      #binding.pry # 3
      eaten_foods.map { |eaten_food| Foodtype.where(name: eaten_food[0]).first.as_json }
    end
=begin
    def recommended_daily_intake
      @recommended_daily_intake = {
        energy: 2400,
        carbohydrates: 0,
        fat: 85,
        protein: 170,
        fiber: 38,
        water: nil,
        alcohol: nil,
        ash: nil,
        monosaccharides: nil,
        disackarides: nil,
        sucrose: nil,
        whole_grains_total: 90, # 90g
        sugar_types: 2400 * 0.1, # not RDI, but maximum
        total_saturated_fatty_acids: 2400 * 0.1, # mättade fetter Intaget av mättade fettsyror bör begränsas till mindre än 10 E%.
        fatty_acid: '???', # fettsyra
        lauric_acid: '???', # laurinsyra
        myristic_acid: '???',
        palmitic_acid: '???',
        stearic_acid: '???',
        arakidic_acid: '???',
        total_monosaturated_fatty_acids: 2400 * 0.1, # enkelmättade fetter Intaget av cis-enkelomättade fettsyror bör vara 10–20 procent av energiintaget (E%).
        palmitolic_acid: '???',
        oleic_acid: '???',
        total_polysaturated_fatty_acids: 2400 * 0.05, # Intaget av cis-fleromättade fettsyror bör vara 5–10 E%, varav n-3-fettsyror bör bidra med minst 1 E%.
        linoleic_acid_c182: '???',
        linoleic_acid_c183: '???',
        arakidonic_acid: '???',
        epa: '???',
        dpa: '???',
        dha: '???',
        cholesterol: 0, # TRANSFETT - Intaget av transfettsyror bör vara så lågt som möjligt.
        retinol: '???',
        vitamin_a: 900,
        b_carotene: '???',
        vitamin_d: 10,
        vitamin_e: 8,
        vitamin_k: 75,
        tiamin: 1.4,
        riboflavin: 1.7,
        vitamin_c: 75,
        niacin: 19,
        niacin_equivalents: 19,
        vitamin_b6: 16,
        vitamin_b12: 2,
        folate: 200,
        phosphorus: 600,
        iodine: 150,
        iron: 9,
        calcium: 800,
        potassium: 3.5,
        copper: 0.9,
        magnesium: 350,
        sodium: 0.5,
        selenium: 50,
        zinc: 9,
        waste: 0,
      }
      @recommended_daily_intake.each do |key, value|
        if value == '???'
          @recommended_daily_intake[key] = nil
        end
      end
      return @recommended_daily_intake
    end

    def percentages_of_rdi_achieved_grouped_by_day(foods_grouped_by_day)
      #foods_grouped_by_day.map { |single_day_eaten_foods| single_day_eaten_foods[:date], percentages_of_rdi_achieved(single_day_eaten_foods[:eaten_foods]) }
      @percentages_of_rdi_achieved_grouped_by_day = []
      foods_grouped_by_day.each do |single_day_eaten_foods|
        percentage_hash = {}
        percentage_hash[:date] = single_day_eaten_foods[:date]
        percentage_hash[:eaten_foods] = percentages_of_rdi_achieved(single_day_eaten_foods[:eaten_foods])
        @percentages_of_rdi_achieved_grouped_by_day << percentage_hash
        percentage_hash = {}
      end
      @percentages_of_rdi_achieved_grouped_by_day
    end

    def percentages_of_rdi_achieved(single_day_eaten_foods)
      percentages_of_rdi_per_eaten_food = single_day_eaten_foods.map { |eaten_food| calculate_percentage_of_rdi(eaten_food) }
      @nutrient_percentage_sum = {}
      percentages_of_rdi_per_eaten_food.first.each do |nutrient_name, value| # FIRST MIGHT BE WEAK
        if is_number?(value)
          values_for_single_nutrient_type = percentages_of_rdi_per_eaten_food.map { |eaten_food| convert_nil_to_zero(eaten_food[nutrient_name]) }
          @nutrient_percentage_sum["#{nutrient_name}"] = sum_of(values_for_single_nutrient_type)
        end
      end
      return @nutrient_percentage_sum
    end

    def calculate_percentage_of_rdi(eaten_food) # Method can be used to show how much rdi a foodtype achieves if modified
      @percentage_of_rdi_consumed = {}
      nutrient_type_sums = sum_up_nutrient_types(eaten_food)
      recommended_daily_intake.each do |nutrient, rdi_value|
        if nutrient_type_sums[nutrient].nil? || rdi_value.nil?
        else
          percentage_of_rdi = (nutrient_type_sums[nutrient] / rdi_value)
          @percentage_of_rdi_consumed["#{nutrient}"] = percentage_of_rdi * 100.0
        end
      end
      #binding.pry
      return @percentage_of_rdi_consumed
    end
=end
    def dates_for_eaten_foods
      EatenFood.all.group_by_day(:eaten_at).count
    end

    def eaten_foods_on_a_single_day_with_nutrients(date) # {foodname: {nutrient: amount}}
      @eaten_foods_on_a_single_day_with_nutrients = {}
      eaten_foods = eaten_foods_on_a_single_day(date) # Hash {foodname: amount}
      eaten_foods.each do |name, amount|
        nutrients = get_single_food_types_for(name)
        @eaten_foods_on_a_single_day_with_nutrients[name] = multiplied_nutrient_amounts(nutrients, amount)
      end
    end

    def multiplied_nutrient_amounts(nutrients, eaten_amount)
      nutrients.delete('name') # move somewhere else
      nutrients.each do |nutrient, amount|
        unless amount.nil?
          nutrients[nutrient] = amount * eaten_amount / 100
        end
      end
    end

    def eaten_foods_on_a_single_day(date_converted) # Hash {foodname: amount}
      EatenFood.where(eaten_at: "#{date_converted}T00:00:00+00:00").
        map {|f| {f.name => f.amount}}.first # remove first
    end

    def food_type_name_and_nutrient_names
       # WEAK WITH FIRST
      remove_ids_names_timestamps(Foodtype.first.attributes)
    end

    def remove_ids_names_timestamps(foodtype_attributes)
      if foodtype_attributes.is_a?(Hash)
        foodtype_attributes.delete_if { |h| h['id'] == 'id' || h['name'] == 'name' || h['created_at'] == 'created_at' || h['updated_at'] == 'updated_at' }
      else
        foodtype_attributes
      end
    end

    def convert_date(date)
      date.to_date
    end

    def sum_of(values)
      values.inject(0){|sum,x| sum + x }
    end

    def is_number?(value)
      value.is_a?(Float) || value.is_a?(Integer)
    end

    def convert_by_hundred_gram(eaten_food)
      @number_of_hundred_grams = eaten_food.amount / 100.0
    end

    def convert_nil_to_zero(value) # check ifthis should be needed. why should anythin be nil.
      value.nil? ? (value = 0.0) : value
    end
end
