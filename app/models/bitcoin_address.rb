class BitcoinAddress < ActiveRecord::Base
  def as_json(options={})
    {
      id:       id, 
      address:  address
    }
  end

end
