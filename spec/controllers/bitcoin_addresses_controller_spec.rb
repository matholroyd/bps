require 'spec_helper'


describe BitcoinAddressesController do
  let(:result) { JSON.parse(response.body) }

  PublicBitcoinAddressJSON = Hash
  shared_examples_for PublicBitcoinAddressJSON do
    %w{id_alias address public_key description}.each do |field|
      it "should have #{field}" do
        result[field].to_s.should be_present
      end
    end

    %w{id private_key}.each do |field|
      it "should not have #{field}" do
        result[field].should be_nil
      end
    end
  end

  describe '#create' do
    context "normal" do
      before :each do
        post :create, bitcoin_address: {description: "payment for dinner"}, format: :json
      end

      it_behaves_like PublicBitcoinAddressJSON
    
      it "should have correct description" do
        JSON.parse(response.body)['description'].should == "payment for dinner"
      end
    end
    
    context "hacking" do
      let(:private_key) { Bitcoin::Key.generate.priv }
      
      it "fails if try to set private key" do
        lambda {
          post :create, bitcoin_address: {description: "payment for dinner", private_key: private_key}, format: :json  
        }.should raise_error
      end
    end
  end

  describe '#show' do
    let(:bitcoin_address) { BitcoinAddress.make }
    
    context "normal" do

      before :each do
        get :show, id: bitcoin_address.id_alias, format: :json
      end

      it_behaves_like PublicBitcoinAddressJSON

      %w{id_alias address public_key description}.each do |field|
        it "should have #{field}" do
          result[field].to_s.should == bitcoin_address.send(field).to_s
        end
      end
    end
    
    context "hacking" do
      it "using id does not work" do
        lambda {
          get :show, id: bitcoin_address.id, format: :json  
        }.should raise_error(ActiveRecord::RecordNotFound)
      end
      
      it "using address does not work" do
        lambda {
          get :show, id: bitcoin_address.address, format: :json  
        }.should raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

end
