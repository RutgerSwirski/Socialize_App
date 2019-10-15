puts 'Creating Users...'
20.times do 
	User.create(email: Faker::Internet.email,first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: '123456', photo: 'https://images.unsplash.com/photo-1558898479-33c0057a5d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80', address: Faker::Address.city, description: Faker::Lorem.paragraph)
end
puts 'Done!'