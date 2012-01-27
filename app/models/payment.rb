class Payment < ActiveRecord::Base
  validates :bitcoin_address, presence: true
end