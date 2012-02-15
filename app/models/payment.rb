class Payment < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :bitcoin_address
  
  validates :transaction,         presence: true
  validates :bitcoin_address_id,  presence: true, uniqueness: {scope: :transaction_id}
  validates :amount,              presence: true
  
  default_scope order: 'updated_at DESC'
end