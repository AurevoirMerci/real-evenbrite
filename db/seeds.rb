require 'faker'

20.times do
	User.create(email: "#{Faker::Name.first_name.downcase}@yopmail.com", password: "aaaaaa", password_confirmation: "aaaaaa", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Hipster.sentence)
end

8.times do
	Event.create(start_date: Faker::Date.forward(365), duration: 45, title: Faker::Hipster.sentence, description: Faker::Hipster.paragraph, price: rand(1..1000), location: Faker::Address.city, admin: User.all.sample)
end

30.times do 
	Attendance.create(stripe_customer_id: Faker::IDNumber.valid, event_id: rand(1..4), participant_id: rand(1..20))
end

