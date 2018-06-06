require 'devise'

user = User.new(
  email:                  'admin@example.com',
  password:               'password',
  password_confirmation:  'password'
)
user.skip_confirmation!
user.save!

10.times do
  RegisteredApplication.create!(
    name: Faker::App.name,
    url:  Faker::Internet.url,
    user: User.first
  )
end
apps = RegisteredApplication.all

100.times do
  Event.create!(
    name: Faker::WorldCup.team,
    registered_application: apps.sample
  )
end

puts "Seed finished"
puts "#{User.count} user created"
puts "#{RegisteredApplication.count} apps created"
puts "#{Event.count} events created"
