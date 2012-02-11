module BPS
  class Bitcoin
    Base58Chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a - %w{0 O I l}
    AddressRexExp = /^1[#{Base58Chars}]{33}$/
  end
end