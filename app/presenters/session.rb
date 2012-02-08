class Session < Presenter
  attr_accessor :email, :password

  validates :email,     presence: true, email: true
  validates :password,  presence: true
        
  validate do
    errors.add :base, "Sign in details are incorrect" if User.authenticate(email, password).nil?
  end
  
  def user
    User.authenticate(email, password)
  end
    
end