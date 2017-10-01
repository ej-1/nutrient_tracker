# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

eaten_foods = EatenFood.create([
	{ name: 'Broccoli', amount: 300 },
  { name: 'Kyckling bröstfilé u skinn ugnsstekt', amount: 300, eaten_at: '2017-05-01T00:00:00+00:00' },
  { name: 'Ris långkornigt kokt m salt', amount: 200, eaten_at: '2017-05-01T00:00:00+00:00' },
  { name: 'Havregrynsgröt fullkorn', amount: 60, eaten_at: '2017-05-01T00:00:00+00:00' },
  { name: 'Mellanmjölk fett  1,5% berik m D-vitamin', amount: 400, eaten_at: '2017-05-01T00:00:00+00:00' },
  { name: 'Blåbärssoppa', amount: 200, eaten_at: '2017-05-01T00:00:00+00:00' },
])

eaten_foods_2 = EatenFood.create([
  { name: 'Broccoli', amount: 300, eaten_at: '2017-05-02T00:00:00+00:00' },
  { name: 'Kyckling bröstfilé u skinn ugnsstekt', amount: 300, eaten_at: '2017-05-02T00:00:00+00:00' },
  { name: 'Ris långkornigt kokt m salt', amount: 300, eaten_at: '2017-05-02T00:00:00+00:00' },
  { name: 'Havregrynsgröt fullkorn', amount: 60, eaten_at: '2017-05-02T00:00:00+00:00' },
  { name: 'Mellanmjölk fett  1,5% berik m D-vitamin', amount: 400, eaten_at: '2017-05-02T00:00:00+00:00' },
  { name: 'Blåbärssoppa', amount: 200, eaten_at: '2017-05-02T00:00:00+00:00' },
])
