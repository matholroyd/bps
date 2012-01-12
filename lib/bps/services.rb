module BPS
  class Services
    class << self 
      def random_alphanum(size)
        chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
        (1..size).collect{|a| chars[rand(chars.size)] }.join
      end    
    end
  end
end