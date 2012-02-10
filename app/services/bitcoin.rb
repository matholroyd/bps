class Bitcoin
  Base58Chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a - %w{0 O I l}
  AddressRexExp = /^1[#{Base58Chars}]{33}$/

  class << self
    def random_address
      BitcoinAddress.new address: ("1" + random_base58(33)),
        private_key: random_base58(64),
        public_key: random_base58(130)
    end
    
    def random_base58(length)
      (1..length).collect { |a| Services.random_char(Base58Chars) }.join
    end
  end
end