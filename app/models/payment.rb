class Payment < ActiveRecord::Base
  belongs_to :bitcoin_address
  
  validates :bitcoin_address, presence: true
  validates :description,     presence: true
  
  def as_json(options={})
    {
      id:               id, 
      description:      description,
      email:            email,
      payer:            payer,
      bitcoin_address:  bitcoin_address
    }
  end
  
end