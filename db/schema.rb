# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170426232427) do

  create_table "eaten_foods", force: :cascade do |t|
    t.string   "name"
    t.integer  "amount"
    t.string   "eaten_at",   default: "2017-05-03 16:07:53.417633"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "foodtypes", force: :cascade do |t|
    t.string   "name"
    t.float    "energy"
    t.float    "carbohydrates"
    t.float    "fat"
    t.float    "protein"
    t.float    "fiber"
    t.float    "water"
    t.float    "alcohol"
    t.float    "ash"
    t.float    "monosaccharides"
    t.float    "disackarides"
    t.float    "sucrose"
    t.float    "whole_grains_total"
    t.float    "sugar_types"
    t.float    "total_saturated_fatty_acids"
    t.float    "fatty_acid"
    t.float    "lauric_acid"
    t.float    "myristic_acid"
    t.float    "palmitic_acid"
    t.float    "stearic_acid"
    t.float    "arakidic_acid"
    t.float    "total_monosaturated_fatty_acids"
    t.float    "palmitolic_acid"
    t.float    "oleic_acid"
    t.float    "total_polysaturated_fatty_acids"
    t.float    "linoleic_acid_c182"
    t.float    "linoleic_acid_c183"
    t.float    "arakidonic_acid"
    t.float    "epa"
    t.float    "dpa"
    t.float    "dha"
    t.float    "cholesterol"
    t.float    "retinol"
    t.float    "vitamin_a"
    t.float    "b_carotene"
    t.float    "vitamin_d"
    t.float    "vitamin_e"
    t.float    "vitamin_k"
    t.float    "tiamin"
    t.float    "riboflavin"
    t.float    "vitamin_c"
    t.float    "niacin"
    t.float    "niacin_equivalents"
    t.float    "vitamin_b6"
    t.float    "vitamin_b12"
    t.float    "folate"
    t.float    "phosphorus"
    t.float    "iodine"
    t.float    "iron"
    t.float    "calcium"
    t.float    "potassium"
    t.float    "copper"
    t.float    "magnesium"
    t.float    "sodium"
    t.float    "salt"
    t.float    "selenium"
    t.float    "zinc"
    t.float    "waste"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
