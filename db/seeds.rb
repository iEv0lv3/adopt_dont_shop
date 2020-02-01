# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shelter.destroy_all

shelter1 = Shelter.create(name: 'Pet Palace',
                          address: '4231 Ponderosa Court',
                          city: 'Boulder',
                          state: 'CO',
                          zip: '80301')

shelter2 = Shelter.create(name: 'Xylia\'s Doggo Friends',
                          address: '5723 Redwood Court',
                          city: 'Boulder',
                          state: 'CO',
                          zip: '80301')

shelter3 = Shelter.create(name: 'Zeus\'s Puppy Pals',
                          address: '3734 Cedar Court',
                          city: 'Boulder',
                          state: 'CO',
                          zip: '80301')
