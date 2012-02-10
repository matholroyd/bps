class BitcoinAddress < ActiveRecord::Base
  validates :address,     presence: true
  validates :public_key,  presence: true
  validates :private_key, presence: true
  validates :description, presence: true

  default_scope order: 'updated_at DESC'
end
