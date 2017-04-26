require 'pry'
require 'roo'

class UploadFoodDatabase
  def parse_file_into_objects
    xlsx = Roo::Excelx.new("./LivsmedelsDB_201704262319.xlsx")
    headers = xlsx.row(2)

    food_values = xlsx.drop(1)
    food_values = food_values.drop(1)

    foodtypes = []
    food_values.each do |food|
      @array = []
      i = 0
      food.each do |value|
        @array << headers[i]
        @array << value
        i = i + 1
      end
      hash = Hash[*@array]
      foodtypes << hash
    end
    binding.pry
    foodtypes
  end
end
