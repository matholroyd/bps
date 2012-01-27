require 'spec_helper'

describe Payment do
  describe 'validations' do
    it 'blueprint should be valid' do
      Payment.make
    end

    %w{bitcoin_address}.each do |field|
      it "requires #{field}" do
        Payment.make_unsaved(field => nil).should_not be_valid
      end
    end
  end
  
end
