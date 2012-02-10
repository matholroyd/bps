module BPS
  class Services
    class << self 
      def random_alphanum(size)
        chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
        (1..size).collect{|a| chars[rand(chars.size)] }.join
      end    
      
      def random(model)
        choices = model.limit(5)
        if choices.count > 0
          choices[rand(choices.count)]
        else
          nil
        end
      end
      
    end
  end
end