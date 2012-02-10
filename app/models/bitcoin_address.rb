class BitcoinAddress < ActiveRecord::Base
  def as_json(options={})
    {
      id:           id, 
      address:      address,
      public_key:   public_key,
      private_key:  private_key
    }
  end

end
