class NoHtmlValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if value =~ /<|>/
      record.errors[attribute] << (options[:message] || "may not contain '<' or '>'") 
    end
  end
  
end
