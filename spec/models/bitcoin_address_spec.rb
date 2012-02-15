require 'spec_helper'

describe BitcoinAddress do
  let(:other_key) { Bitcoin::Key.generate }
  
  describe 'auto-generated fields' do
    it do
      ba = BitcoinAddress.create private_key: other_key.priv, description: "something"
      ba.should be_valid
      ba.public_key.should == other_key.pub
      ba.address.should == other_key.addr
      ba.id_alias.should_not be_nil
    end
  end
  
  
  describe 'validations' do
    it 'blueprint should be valid' do
      BitcoinAddress.make
    end

    %w{private_key description}.each do |field|
      it "requires #{field}" do
        BitcoinAddress.make_unsaved(field => nil).should_not be_valid
      end
    end
    
    it "cannot have < or > in the description" do
      BitcoinAddress.make_unsaved(description: "I am a <hacker").should_not be_valid
      BitcoinAddress.make_unsaved(description: "I am a hacker>").should_not be_valid
      BitcoinAddress.make_unsaved(description: "I am a <scrrip>alert('muhaha!');</script>").should_not be_valid
    end
    
    describe "auto-generated" do
      let(:bitcoin_address) { BitcoinAddress.make }
    
      it "should require a valid public/private key pair" do
        bitcoin_address.public_key = other_key.pub
        bitcoin_address.should_not be_valid
      end
    
      it "should require a valid address/private key pair" do
        bitcoin_address.address = other_key.addr
        bitcoin_address.should_not be_valid
      end
    
      it "should require id_alias" do
        bitcoin_address.id_alias = nil
        bitcoin_address.should_not be_valid
      end
      
    end
    
  end
end
