class Site < ActiveRecord::Base
  include AASM

  validates :name,  presence: true
  validates :state, presence: true

  aasm_column :state
  aasm_initial_state :unlocked

  aasm_state :unlocked
  aasm_state :locked_to_owner
  
  aasm_event :lock_to_owner do
    transitions to: :locked_to_owner, from: [:unlocked]
  end
  
  def self.locked_to_owner?
    !unlocked?
  end

  def self.unlocked?
    Site.first.nil? || Site.first.unlocked?
  end
  
  def self.lock_to_owner!
    Site.first.lock_to_owner!
  end
    
  def self.data
    Site.first
  end
  
end