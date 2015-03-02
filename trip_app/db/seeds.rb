# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Itinerary.destroy_all
Activity.destroy_all
Review.destroy_all


User.create(first_name: 'Tom', last_name: 'Smith', username: 'tsmith', email: 'tsmith@smith.com', password: 'tsmith1')
User.create(first_name: 'George', last_name: 'Navas', username: 'gnavas', email: 'gannavas@gmail.com', password: 'gnavas1')
User.create(first_name: 'Ryan', last_name: 'Wilson', username: 'rwilson', email: 'rycwilson@gmail.com', password: 'rwilson1')
User.create(first_name: 'Jenni', last_name: 'Choi', username: 'jchoi', email: 'jenni0729@gmail.com', password: 'jchoi1')
User.create(first_name: 'Mary', last_name: 'Kim', username: 'mkim', email: 'jac2292@caa.columbia.edu', password: 'mkim1')
User.create(first_name: 'Kevin', last_name: 'Ortiz', username: 'kortiz', email: 'kotiz@ortiz.com', password: 'kortiz1')
User.create(first_name: 'Eugene', last_name: 'Choi', username: 'echoi', email: 'echoi@choi.com', password: 'echoi1')
User.create(first_name: 'Jackie', last_name: 'Sasscer', username: 'jsasscer', email: 'jsasscer@gmail.com', password: 'jsasscer1')
User.create(first_name: 'Erin', last_name: 'Huie', username: 'ehuie', email: 'ehuie@gmail.com', password: 'ehuie1')
User.create(first_name: 'Peggy', last_name: 'Little', username: 'plittle', email: 'plittle@gmail.com', password: 'plittle1')

Itinerary.create(origin: 'San Francisco', destination: 'Baltimore', name: 'Bmore Trip', user_id: 1, departure_date: '2015-4-1', return_date: '2015-4-7')
Itinerary.create(origin: 'Baltimore', destination: 'San Francisco', name: 'SF Trip', user_id: 2, departure_date: '2015-5-1', return_date: '2015-5-7')
Itinerary.create(origin: 'San Francisco', destination: 'London', name: 'London Trip', user_id: 3, departure_date: '2015-6-1', return_date: '2015-6-7')

Activity.create(location: 'Alcatraz', name: 'Alcatraz Trip', itinerary_id: 1, date: '2015-4-2', start_date: '2015-4-1', end_date: '2015-4-7')
Activity.create(location: 'Ghirardelli Square', name: 'Ghirardelli Trip', itinerary_id: 1, date: '2015-4-3', start_date: '2015-4-1', end_date: '2015-4-7')
Activity.create(location: 'National Aquarium', name: 'See Fishies', itinerary_id: 2, date: '2015-5-2', start_date: '2015-5-1', end_date: '2015-5-7')
Activity.create(location: 'Federal Hill', name: 'Fed Hill Trip', itinerary_id: 2, date: '2015-5-3', start_date: '2015-5-1', end_date: '2015-5-7')
Activity.create(location: 'Globe Theater', name: 'Globe Theater Trip', itinerary_id: 3, date: '2015-6-2', start_date: '2015-6-1', end_date: '2015-6-7')
Activity.create(location: 'Buckingham Palace', name: 'Buckingham Trip', itinerary_id: 3, date: '2015-6-3', start_date: '2015-6-1', end_date: '2015-6-7')

ItinerariesUser.create(user_id: 1 , itinerary_id: 1)
ItinerariesUser.create(user_id: 2 , itinerary_id: 1)
ItinerariesUser.create(user_id: 3 , itinerary_id: 1)
ItinerariesUser.create(user_id: 4 , itinerary_id: 1)
ItinerariesUser.create(user_id: 5 , itinerary_id: 2)
ItinerariesUser.create(user_id: 6 , itinerary_id: 2)
ItinerariesUser.create(user_id: 7 , itinerary_id: 2)
ItinerariesUser.create(user_id: 8 , itinerary_id: 2)
ItinerariesUser.create(user_id: 9 , itinerary_id: 3)
ItinerariesUser.create(user_id: 10 , itinerary_id: 3)

ActivitiesUser.create(activity_id: 1, user_id: 1)
ActivitiesUser.create(activity_id: 2, user_id: 2)
ActivitiesUser.create(activity_id: 1, user_id: 3)
ActivitiesUser.create(activity_id: 2, user_id: 4)
ActivitiesUser.create(activity_id: 3, user_id: 5)
ActivitiesUser.create(activity_id: 4, user_id: 6)
ActivitiesUser.create(activity_id: 3, user_id: 7)
ActivitiesUser.create(activity_id: 4, user_id: 8)
ActivitiesUser.create(activity_id: 5, user_id: 9)
ActivitiesUser.create(activity_id: 6, user_id: 10)

Review.create(content: "Tom is the best person to travel with!", reviewable_type: "user", reviewable_id: 1)
Review.create(content: "George is the best person to travel with!", reviewable_type: "user", reviewable_id: 2)
Review.create(content: "Ryan is the best person to travel with!", reviewable_type: "user", reviewable_id: 3)
Review.create(content: "Jenni is the best person to travel with!", reviewable_type: "user", reviewable_id: 4)
Review.create(content: "Mary is the best person to travel with!", reviewable_type: "user", reviewable_id: 5)
Review.create(content: "Kevin is the best person to travel with!", reviewable_type: "user", reviewable_id: 6)
Review.create(content: "Eugene is the best person to travel with!", reviewable_type: "user", reviewable_id: 7)
Review.create(content: "Jackie is the best person to travel with!", reviewable_type: "user", reviewable_id: 8)
Review.create(content: "Erin is the best person to travel with!", reviewable_type: "user", reviewable_id: 9)
Review.create(content: "Peggy is the best person to travel with!", reviewable_type: "user", reviewable_id: 10)

Review.create(content: "Baltimore Rocks!", reviewable_type: "itinerary", reviewable_id: 1)
Review.create(content: "San Francisco Rocks!", reviewable_type: "itinerary", reviewable_id: 2)
Review.create(content: "London Rocks!", reviewable_type: "itinerary", reviewable_id: 3)

Review.create(content: "Love Alcatraz!", reviewable_type: "activity", reviewable_id: 1)
Review.create(content: "Love Ghirdelli Square!", reviewable_type: "activity", reviewable_id: 2)
Review.create(content: "Love National Aquarium!", reviewable_type: "activity", reviewable_id: 3)
Review.create(content: "Love Federal Hill!", reviewable_type: "activity", reviewable_id: 4)
Review.create(content: "Love Globe Theater!", reviewable_type: "activity", reviewable_id: 5)
Review.create(content: "Love Buckingham Palace!", reviewable_type: "activity", reviewable_id: 6)