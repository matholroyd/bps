class Transaction < ActiveRecord::Base
  has_many :payments
  
  validates :binary, presence: true, bitcoin_transaction_in_hex: true
end
