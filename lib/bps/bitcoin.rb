module BPS
  class Bitcoin
    Base58Chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a - %w{0 O I l}
    AddressRexExp = /^1[#{Base58Chars}]{20,33}$/
    
    class << self
      
      def parse_transaction_json(json)
        # Transactions in the normal bitcoin json format are not accepted by the 
        # Ruby bitcon library! The from_json method needs the value of the first
        # key-value pair in the standard bitcoin json format
        data_that_ruby_library_needs = JSON.load(json).first[1]
        ::Bitcoin::Protocol::Tx.from_json data_that_ruby_library_needs.to_json
      end
      
    end
    
  end
end