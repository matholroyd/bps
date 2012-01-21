class CheckPassword < Presenter
  attr_accessor :password, :user

  validates :user, presence: true
  validates_each :password do |record, attr, value|
    record.errors.add(attr, "is not correct") if User.authenticate(record.user.email, value).nil?
  end
  
  def save
    valid?
  end
  
end