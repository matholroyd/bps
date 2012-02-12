class Transaction < ActiveRecord::Base
  validates :binary, presence: true, bitcoin_transaction_in_hex: true
end
