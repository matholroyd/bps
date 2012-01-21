class CheckPassword < Presenter
  def_delegators :user, :password, :password=
  
  def self.model_name
    result = 'check_password'
    def result.singular
      'check_password'
    end
    def result.param_key
      ''
    end
    result
  end
  
  def to_key
    ['a']
  end
      
  def user
    @user ||= User.new
  end
end