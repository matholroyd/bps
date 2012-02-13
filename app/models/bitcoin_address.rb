class BitcoinAddress < ActiveRecord::Base
  validates :address,     presence: true
  validates :public_key,  presence: true
  validates :private_key, presence: true
  validates :description, presence: true

  validates_each :public_key do |record, attr, public_key|
    if record.private_key.present?
      k = Bitcoin::Key.new(record.private_key)
      record.errors.add(:public_key, 'does not match private key') if public_key != k.pub
      record.errors.add(:address, 'does not match private key') if record.address != k.addr
    end
  end
 
  def private_key=(value)
    key = Bitcoin::Key.new(value)
    self.public_key = key.pub
    self.address    = key.addr
    
    super
  end
  
  default_scope order: 'updated_at DESC'
  
  def self.generate
    k = Bitcoin::Key.generate
    new private_key: k.priv, public_key: k.pub, address: k.addr
  end
end
