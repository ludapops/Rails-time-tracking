# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


(1..15).each do |i| 
	x = Project.create! name: "Project #{i}", description: "this the #{i} description"
	if i % 3 == 0
		x.entries.create hours: 1, minutes: 45, date: Time.now
	end 
end