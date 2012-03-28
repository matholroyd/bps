require 'open-uri'

module Api
  class TransactionTransmitter
    Domain = "http://bitsend.rowit.co.uk"
    
    class << self
      def transmit(tx)
        do_transmit tx.to_payload.unpack('H*').first
      end
      
      private
      
      def do_transmit(data_in_hex)
        if Rails.env.test?
          # do nothing
        else
          open("#{Domain}/?transaction=#{data_in_hex}").read
        end
      end
      
    end
  end
end