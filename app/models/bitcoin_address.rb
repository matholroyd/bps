class BitcoinAddress < ActiveRecord::Base
  validates :address,     presence: true
  validates :public_key,  presence: true
  validates :private_key, presence: true
  validates :description, presence: true
  
  def as_json(options={})
    {
      id:           id, 
      address:      address,
      public_key:   public_key,
      private_key:  private_key
    }
  end

end
