class CreateFoodtypes < ActiveRecord::Migration[5.0]
  def change
    create_table :foodtypes do |t|
      t.string :name
      t.float :energy
      t.float :carbohydrates
      t.float :fat
      t.float :protein
      t.float :fiber
      t.float :water
      t.float :alcohol
      t.float :ash
      t.float :monosaccharides
      t.float :disackarides
      t.float :sucrose
      t.float :whole_grains_total
      t.float :sugar_types
      t.float :total_saturated_fatty_acids # mättade fetter
      t.float :fatty_acid # fettsyra
      t.float :lauric_acid # laurinsyra
      t.float :myristic_acid
      t.float :palmitic_acid
      t.float :stearic_acid
      t.float :arakidic_acid
      t.float :total_monosaturated_fatty_acids # enkelmättade fetter
      t.float :palmitolic_acid
      t.float :oleic_acid
      t.float :total_polysaturated_fatty_acids
      t.float :linoleic_acid_c182
      t.float :linoleic_acid_c183
      t.float :arakidonic_acid
      t.float :epa # EPA
      t.float :dpa # DPA
      t.float :dha # DHA
      t.float :cholesterol
      t.float :retinol
      t.float :vitamin_a
      t.float :b_carotene
      t.float :vitamin_d
      t.float :vitamin_e
      t.float :vitamin_k
      t.float :tiamin
      t.float :riboflavin
      t.float :vitamin_c
      t.float :niacin
      t.float :niacin_equivalents
      t.float :vitamin_b6
      t.float :vitamin_b12
      t.float :folate
      t.float :phosphorus
      t.float :iodine # jod
      t.float :iron
      t.float :calcium
      t.float :potassium # kalium
      t.float :copper
      t.float :magnesium
      t.float :sodium # natrium
      t.float :salt
      t.float :selenium
      t.float :zinc
      t.float :waste
      t.timestamps
    end
  end
end
