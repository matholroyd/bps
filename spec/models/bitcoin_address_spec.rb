require 'spec_helper'

describe BitcoinAddress do
  let(:other_key) { Bitcoin::Key.generate }
  
  describe 'validations' do
    it 'blueprint should be valid' do
      BitcoinAddress.make
    end

    %w{address public_key private_key description}.each do |field|
      it "requires #{field}" do
        BitcoinAddress.make_unsaved(field => nil).should_not be_valid
      end
    end
    
    it "should require a valid public/private key pair" do
      BitcoinAddress.make_unsaved(public_key: other_key.pub).should_not be_valid
    end
    
    it "should require a valid address/private key pair" do
      BitcoinAddress.make_unsaved(address: other_key.addr).should_not be_valid
    end
    
  end
end
