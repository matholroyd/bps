require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.name  { Faker::Name.name }
Sham.email { Faker::Internet.email }
Sham.title { Faker::Lorem.sentence }
Sham.body  { Faker::Lorem.paragraph }

User.blueprint do
  name
  email
  password               { 'super secret' }
  password_confirmation  { 'super secret' }
end

Site.blueprint do
  name { "#{Faker::Name.name}'s BPS" }
end