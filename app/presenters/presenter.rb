class Presenter
  extend Forwardable
  extend ActiveModel::Naming
  include ActiveModel::Validations
  
  attr_reader :errors
  
  def to_key
    []
  end
  
  def initialize(params = {})
    params.each_pair do |attribute, value| 
      self.send :"#{attribute}=", value
    end

    @errors = ActiveModel::Errors.new(self)
  end
  
  # http://api.rubyonrails.org/classes/ActiveModel/Errors.html
  # next 3 methods needed for errors to work properly
  def read_attribute_for_validation(attr)
    send(attr)
  end
  
  def self.human_attribute_name(attr, options = {})
    attr.to_s.humanize
  end
  
  def self.lookup_ancestors
    [self]
  end
  
end