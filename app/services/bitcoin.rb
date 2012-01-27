class Bitcoin
  Base58Chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a - %w{0 O I l}
  AddressRexExp = /^1[#{Base58Chars}]{33}$/

  class << self
    def random_address
      "1" + (1..33).collect { |a| Services.random_char(Base58Chars) }.join
    end
  end
end