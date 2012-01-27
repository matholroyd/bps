class User < ActiveRecord::Base
  attr_accessible :full_name, :email, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  validates :password, length: {minimum: 8},  if: "password.present?"

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, email: true
  
  def set_random_password
    self.password = BPS::Services.random_alphanum(12)
    self.password_confirmation = self.password
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def self.setup?
    User.first.present?
  end
  
  private
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
