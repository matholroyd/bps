class Services
  TwitterUsernameChars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + %w{_ -}
  TwitterUserNameRegexp = /^[#{TwitterUsernameChars}]+$/
  
  PhoneNumberChars = (0..9).to_a
  PhoneNumberRegexp = /^\+?[#{PhoneNumberChars}]{8,25}$/
  
  class << self
    def random_digits(length)
      DBC.require(length > 0)
    
      chars = ('0'..'9').to_a
      (1..length).collect{|a| random_char(chars) }.join
    end
    
    def random_twitter_username
      "@" + (5..(5+rand(6))).collect { |a| random_char(TwitterUsernameChars) }.join
    end
    
    def random_char(chars)
      chars[rand(chars.length)]
    end
  end
end