class BitcoinTransactionInHexValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    begin 
      tx = Bitcoin::Protocol::Tx.new value
    rescue
      record.errors[attribute] << (options[:message] || "is not valid") 
    end
  end
  
end
