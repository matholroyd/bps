require 'spec_helper'

describe Site do
  describe 'validations' do
    it 'blueprint should be valid' do
      Site.make
    end
    
    %w{name}.each do |field|
      it "requires #{field}" do
        Site.make_unsaved(field => nil).should_not be_valid
      end
    end
  end
  
  describe 'locked?' do
    it do
      Site.should_not be_locked_to_owner
      Site.should     be_unlocked

      site = Site.make 
      Site.should_not be_locked_to_owner
      Site.should     be_unlocked
      
      site.lock_to_owner!
      Site.should     be_locked_to_owner
      Site.should_not be_unlocked
    end
    
  end
  
end
