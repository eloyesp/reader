# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Seeding default profiles'
{basic: 10,  medium: 20, premium: 100}.each do |name, limit|
  Profile.find_or_create_by_name!(name, max_channels_allowed: limit)
end

puts 'SETTING UP DEFAULT USER LOGIN'

user = User.find_or_create_by_email! 'user@example.com', :login => 'First User',
  :password => 'please', :password_confirmation => 'please',
  :first_name => 'first_name', :last_name => "last_name",
  :profile => Profile.find_by_name('basic')
user.confirm!
puts 'Defaul user created: ' << user.login

