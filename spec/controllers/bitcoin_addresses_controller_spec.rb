require 'spec_helper'

describe BitcoinAddressesController do

  describe '#create' do
    it "should create a " do
      
    end
  end

  describe '#show' do
    let(:bitcoin_address) { BitcoinAddress.make }

    before :each do
      get :show, id: bitcoin_address.id_alias, format: :json
      @data = JSON.parse(response.body)
    end
    
    %w{id_alias address public_key description}.each do |field|
      it "should have #{field}" do
        @data[field].to_s.should == bitcoin_address.send(field).to_s
      end
    end
    
    %w{id private_key}.each do |field|
      it "should not have #{field}" do
        @data[field].should be_nil
      end
    end
    
  end

end
