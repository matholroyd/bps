require 'spec_helper'

describe Wallet do
  context "calculates the balance" do
    it "sums the transaction amounts" do
      Payment.should_receive(:sum).with(:amount) { BigDecimal("10") }
      Wallet.balance.should == BigDecimal("10")
    end
  end
  
  context "sending bitcoins" do
    let(:address_with_bitcoins) { BitcoinAddress.create!( 
        private_key: "1e2e0bc6893d42a462b0039b5c15c3da3378c8d0ec44556b9608efdb2b3caff1",
        description: "test"
    ) }
    let(:external_address) { BitcoinAddress.generate.address }
    
    before :each do
      TransactionImporter.refresh_for [address_with_bitcoins.address]
      # Pretend the last transaction (spending bitcoins) hasn't happened, so appears
      # balance is 0.1
      address_with_bitcoins.transactions.first.destroy
      address_with_bitcoins.payments.first.destroy
    end
    
    it "reduces the balance" do
      Wallet.send_bitcoins(to: external_address, amount: 0.02)
      Wallet.balance.should == 0.08
    end
    
    it "transmits the transaction" do
      Api::TransactionTransmitter.should_receive(:transmit)
      Wallet.send_bitcoins(to: external_address, amount: 0.02)
    end
    
    it "sets a comment" do
      Wallet.send_bitcoins(to: external_address, amount: 0.02, comment: "payback")
      Transaction.last.comment.should == 'payback'
    end
  end
  
  class AddressExternal; end
  
  context "forward bitcoins to own addresses" do
    let(:address) { stub }
        
    it "does nothing if balance = 0" do
      Wallet.stub(:balance) { 0 }
      Wallet.forward_bitcoins_to_my_external_addresses 
    end
    
    it "picks an address from the pool of external address marked for forwarding" do
      Wallet.stub(:balance) { 10 }
      AddressExternal.should_receive(:random_forwardable) { address }
      Wallet.should_receive(:send_bitcoins).with(to: address, amount: 10, comment: "Auto forwarding of whole balance")
      Wallet.forward_bitcoins_to_my_external_addresses 
    end
  end
  
end