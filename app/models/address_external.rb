class AddressExternal < ActiveRecord::Base
  validates :address, presence: true, bitcoin_address: true
    
  scope :forwardable, where(forwardable: true)
  
  def self.random_forwardable
    f = forwardable
    pick = rand(f.count)
    f[pick]
  end
  
  def mark_as_forwardable!
    self.forwardable = true
  end  
end