require 'spec_helper'

describe User do
  describe 'validations' do
    it 'blueprint should be valid' do
      User.make
    end

    %w{email password name}.each do |field|
      it "requires #{field}" do
        User.make_unsaved(field => nil).should_not be_valid
      end
    end
  end
  
  describe 'setup?' do
    it do
      User.should_not be_setup
    end
    
    it do 
      User.make
      User.should be_setup
    end
  end
  
end
