class Transaction < ActiveRecord::Base
  has_many :payments
  
  validates :binary, presence: true, bitcoin_transaction_in_hex: true
  validates :bitcoin_tx_hash, uniqueness: true
    
  def self.order_by_most_recent
    order('created_at DESC')
  end  
    
  def binary=(value)
    begin
      self.bitcoin_tx_hash = Bitcoin::Protocol::Tx.new(value).hash
    rescue
    end
    
    super
  end
  
  def bitcoin_tx
    @bitcoin_tx ||= Bitcoin::Protocol::Tx.new(binary)
  end
  
end
