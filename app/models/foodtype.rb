class Foodtype < ApplicationRecord
  require 'tasks/upload_food_database'

  def self.save_foodtypes_to_database
    foodtypes = UploadFoodDatabase.new.parse_file_into_objects
    binding.pry
    foodtypes.each do |foodtype|
      Foodtype.new(foodtype).save
    end
  end
end
