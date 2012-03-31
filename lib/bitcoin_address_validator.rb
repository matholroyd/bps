class BitcoinAddressValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if (value =~ BPS::Bitcoin::AddressRexExp).nil?
      record.errors[attribute] << (options[:message] || " '#{value}' is not valid") 
    end
  end
  
end
