class Payment < ActiveRecord::Base
  validates :bitcoin_address, presence: true
  validates :description, presence: true
  
  def self.safe_fields
    [:id, :bitcoin_address]
  end
end