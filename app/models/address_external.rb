class AddressExternal < ActiveRecord::Base
  validates :address, presence: true, bitcoin_address: true
  
  def mark_as_forwardable!
    self.forwardable = true
  end
end