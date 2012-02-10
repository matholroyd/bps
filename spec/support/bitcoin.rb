module BitcoinHelpers
  def public_key(bitcoin_address)
    BitcoinAddress.find_by_address(bitcoin_address).public_key
  end
  
  def private_key(bitcoin_address)
    BitcoinAddress.find_by_address(bitcoin_address).private_key
  end
end

RSpec.configuration.include BitcoinHelpers