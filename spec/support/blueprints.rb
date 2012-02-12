require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.full_name  { Faker::Name.name }
Sham.email { Faker::Internet.email }
Sham.title { Faker::Lorem.sentence }
Sham.body  { Faker::Lorem.paragraph }

User.blueprint do
  full_name 
  email
  password               { 'super secret' }
  password_confirmation  { 'super secret' }
end

Site.blueprint do
  name { "#{Faker::Name.name}'s BPS" }
end

BitcoinAddress.blueprint do
  private_key  { Bitcoin::Key.generate.priv }
  public_key   { Bitcoin::Key.new(private_key).pub }
  address      { Bitcoin::Key.new(private_key).addr }
  description  { Sham.body }
end

Payment.blueprint do
  transaction
  bitcoin_address
  amount { rand * 10 }
end

Transaction.blueprint do
  raw_in_hex { "a" }
end