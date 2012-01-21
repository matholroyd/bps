class Presenter
  extend Forwardable
  include ActiveModel::Validations
  
  def to_key
    []
  end
  
  def initialize(params = {})
    params.each_pair do |attribute, value| 
      self.send :"#{attribute}=", value
    end
  end
  
end