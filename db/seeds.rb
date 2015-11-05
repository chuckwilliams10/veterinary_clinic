# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pet.delete_all
Pet.create!(customer_id: 11, name: "tommy", pet_type: "dog", breed: "poddle", age: 4, date_last_visit: "2015-8-12 00:00:00", reason: "leg broke",weight:4.0)
Pet.create!(customer_id: 12, name: "beebee", pet_type: "dog", breed: "bulldog", age: 3, date_last_visit: "2015-8-12 00:00:00", reason: "check up",weight:3.0)



Profile.delete_all
Profile.create!(profile_type: "Customer",    name: "John",    address: "386 sip ave", city: "jersity city", state: "NJ", zipcode: "75641", user_id: 1)
Profile.create!(profile_type: "Customer",    name: "Joe",     address: "4350 Dublin Rd",    city: "Dublin",     state: "OH", zipcode: "43230", user_id: 2)
Profile.create!(profile_type: "Doctor",      name: "Bob",     address: "343 Parker Rd",    city: "", state: "TX", zipcode: "78218", user_id: 3, years_practice:5)
Profile.create!(profile_type: "Doctor",      name: "Suzan",   address: "5000 Meadow creek dr",    city: "Dallas", state: "TX", zipcode: "76543", user_id: 1, years_practice:4)
Profile.create!(profile_type: "Doctor",      name: "Admino",  address: "6889 Green dr",    city: "Pittsburgh", state: "TX", zipcode: "37812", user_id: 2, years_practice:8)
Profile.create!(profile_type: "Receptionist",name: "Rachel",  address: "3432 K Ave ",    city: "Plano", state: "TX", zipcode: "75070", user_id: 3)