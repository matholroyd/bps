class BitcoinAddress < ActiveRecord::Base
  validates :id_alias,    presence: true, uniqueness: true
  validates :private_key, presence: true, uniqueness: true
  validates :public_key,  presence: true, uniqueness: true
  validates :address,     presence: true, uniqueness: true, bitcoin_address: true
  validates :description, presence: true,                   no_html: true

  has_many :payments
  has_many :transactions, through: :payments

  validates_each :public_key do |record, attr, public_key|
    if record.private_key.present?
      k = Bitcoin::Key.new(record.private_key)
      record.errors.add(:public_key, 'does not match private key') if public_key != k.pub
      record.errors.add(:address, 'does not match private key') if record.address != k.addr
    end
  end

  before_validation do
    self.id_alias = BPS::Services.random_alphanum(30) if new_record?
  end
 
  def private_key=(value)
    key = Bitcoin::Key.new(value)
    self.public_key = key.pub
    self.address    = key.addr
    
    super
  end
  
  default_scope order: 'updated_at DESC'
  
  def balance
    payments.sum(:amount)
  end
  
  def most_recent_transaction
    transactions.order_by_most_recent.first
  end
    
  def self.sorted_and_non_zero_balance
    all.select {|ba| ba.balance > 0 }.sort {|a, b| b.balance <=> a.balance}
  end  
      
  def self.generate
    k = Bitcoin::Key.generate
    new private_key: k.priv, public_key: k.pub, address: k.addr
  end
end
