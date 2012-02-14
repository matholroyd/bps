# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.


# Since this is open source code, need to force each user to create their own secret token.
if Rails.env.production?
  DBC.assert(ENV['BPS_SECRET_TOKEN'].present?, "\n\nENV['BPS_SECRET_TOKEN'] must be set.\nSee ./script/random_secret_token for information.\n")
  BPS::Application.config.secret_token = ENV['BPS_SECRET_TOKEN']
else
  BPS::Application.config.secret_token = '5d49651b214a5b032c9bd0291fccbdc7467ccecd2c1d101ee0881e05e73955e241aafecbbf2edf24d7d13faf2512683f7d5a6e462c4aa44684005429890fad54'
end

