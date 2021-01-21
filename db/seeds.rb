# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'byebug'


CS.countries.each do |country|
  Country.create(short_name: country[0], name: country[1])
end


CS.states(:IN).each do |states|
  State.create(short_name:states[0], name:states[1])
end
