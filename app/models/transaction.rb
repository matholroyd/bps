class Transaction < ActiveRecord::Base
  validates :raw_in_hex, presence: true
end
