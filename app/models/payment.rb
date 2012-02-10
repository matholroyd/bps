class Payment < ActiveRecord::Base
  belongs_to :bitcoin_address
  
  validates :bitcoin_address, presence: true
  validates :amount,          presence: true

  default_scope order: 'updated_at DESC'
  
  def as_json(options = {})
    {
      bitcoin_address: bitcoin_address,
      amount: amount,
      updated_at: updated_at,
      created_at: created_at
    }
  end
end