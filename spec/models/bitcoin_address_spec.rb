require 'spec_helper'

describe BitcoinAddress do
  let(:other_key) { Bitcoin::Key.generate }
  
  describe 'validations' do
    it 'blueprint should be valid' do
      BitcoinAddress.make
    end

    %w{private_key description}.each do |field|
      it "requires #{field}" do
        BitcoinAddress.make_unsaved(field => nil).should_not be_valid
      end
    end
    
    it "should require a valid public/private key pair" do
      ba = BitcoinAddress.make
      ba.public_key = other_key.pub
      ba.should_not be_valid
    end
    
    it "should require a valid address/private key pair" do
      ba = BitcoinAddress.make
      ba.address = other_key.addr
      ba.should_not be_valid
    end
    
  end
end
